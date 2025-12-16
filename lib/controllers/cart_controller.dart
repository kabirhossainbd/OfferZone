import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;
  final RxBool isProcessing = false.obs;

  double get subtotal => cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  
  double get shipping => cartItems.isEmpty ? 0 : 9.99;
  
  double get tax => subtotal * 0.08; // 8% tax
  
  double get total => subtotal + shipping + tax;

  int get itemCount => cartItems.fold(0, (sum, item) => sum + item.quantity);

  void addToCart(Product product, {String? color, int quantity = 1}) {
    final existingIndex = cartItems.indexWhere(
      (item) => item.product.id == product.id && item.selectedColor == (color ?? product.colors.first),
    );

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity += quantity;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(
        product: product,
        quantity: quantity,
        selectedColor: color ?? product.colors.first,
      ));
    }

    Get.snackbar(
      'Added to Cart',
      '${product.name} has been added to your cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(16),
    );
  }

  void removeFromCart(int productId, String color) {
    cartItems.removeWhere(
      (item) => item.product.id == productId && item.selectedColor == color,
    );
  }

  void updateQuantity(int productId, String color, int quantity) {
    if (quantity <= 0) {
      removeFromCart(productId, color);
      return;
    }

    final index = cartItems.indexWhere(
      (item) => item.product.id == productId && item.selectedColor == color,
    );

    if (index != -1) {
      cartItems[index].quantity = quantity;
      cartItems.refresh();
    }
  }

  void incrementQuantity(int productId, String color) {
    final index = cartItems.indexWhere(
      (item) => item.product.id == productId && item.selectedColor == color,
    );
    if (index != -1) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decrementQuantity(int productId, String color) {
    final index = cartItems.indexWhere(
      (item) => item.product.id == productId && item.selectedColor == color,
    );
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        cartItems.refresh();
      } else {
        removeFromCart(productId, color);
      }
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  Future<bool> processCheckout() async {
    isProcessing.value = true;
    
    // Simulate payment processing
    await Future.delayed(const Duration(seconds: 2));
    
    isProcessing.value = false;
    return true;
  }
}

