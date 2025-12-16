import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  final RxList<Product> products = <Product>[].obs;
  final RxList<Product> filteredProducts = <Product>[].obs;
  final RxBool isLoading = true.obs;
  final RxString selectedCategory = 'All'.obs;
  final RxInt selectedProductIndex = 0.obs;

  final List<String> categories = ['All', 'Electronics', 'Fashion', 'Home'];

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading.value = true;
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));
    
    products.value = DummyProducts.products;
    filteredProducts.value = List.from(products);
    isLoading.value = false;
    update(); // Trigger GetBuilder rebuild
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      filteredProducts.value = List.from(products);
    } else {
      filteredProducts.value = products
          .where((product) => product.category == category)
          .toList();
    }
    update(); // Trigger GetBuilder rebuild
  }

  void toggleFavorite(int productId) {
    final index = products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      final product = products[index];
      products[index] = product.copyWith(isFavorite: !product.isFavorite);
      
      // Update filtered list too
      final filteredIndex = filteredProducts.indexWhere((p) => p.id == productId);
      if (filteredIndex != -1) {
        filteredProducts[filteredIndex] = products[index];
      }
      update(); // Trigger GetBuilder rebuild
    }
  }

  Product? getProductById(int id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
