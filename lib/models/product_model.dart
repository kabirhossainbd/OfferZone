class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviews;
  final String imageUrl;
  final String category;
  final List<String> colors;
  final bool isFavorite;
  final double discount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.category,
    this.colors = const ['#E94560', '#667EEA', '#00D9A5'],
    this.isFavorite = false,
    this.discount = 0,
  });

  double get discountedPrice => price * (1 - discount / 100);

  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    double? rating,
    int? reviews,
    String? imageUrl,
    String? category,
    List<String>? colors,
    bool? isFavorite,
    double? discount,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      colors: colors ?? this.colors,
      isFavorite: isFavorite ?? this.isFavorite,
      discount: discount ?? this.discount,
    );
  }
}

class CartItem {
  final Product product;
  int quantity;
  String selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedColor = '#E94560',
  });

  double get totalPrice => product.discountedPrice * quantity;
}

// Dummy product data
class DummyProducts {
  static List<Product> products = [
    Product(
      id: 1,
      name: 'Premium Wireless Headphones',
      description:
          'Experience crystal-clear sound with our premium wireless headphones. Featuring active noise cancellation, 40-hour battery life, and ultra-comfortable memory foam ear cushions. Perfect for music lovers and professionals alike.',
      price: 299.99,
      rating: 4.8,
      reviews: 2847,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
      category: 'Electronics',
      discount: 15,
      colors: const ['#1A1A2E', '#E94560', '#FFD700'],
    ),
    Product(
      id: 2,
      name: 'Smart Fitness Watch Pro',
      description:
          'Track your fitness journey with precision. Features heart rate monitoring, GPS tracking, sleep analysis, and 100+ workout modes. Water-resistant up to 50 meters with a stunning AMOLED display.',
      price: 449.99,
      rating: 4.9,
      reviews: 5621,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
      category: 'Electronics',
      discount: 20,
      colors: const ['#1A1A2E', '#667EEA', '#00D9A5'],
    ),
    Product(
      id: 3,
      name: 'Designer Leather Backpack',
      description:
          'Handcrafted from premium Italian leather, this backpack combines style with functionality. Features padded laptop compartment, anti-theft pockets, and adjustable straps for ultimate comfort.',
      price: 189.99,
      rating: 4.7,
      reviews: 1253,
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500',
      category: 'Fashion',
      discount: 0,
      colors: const ['#8B4513', '#1A1A2E', '#D4A574'],
    ),
    Product(
      id: 4,
      name: 'Minimalist Desk Lamp',
      description:
          'Illuminate your workspace with elegance. This LED desk lamp features adjustable brightness, color temperature control, and a sleek aluminum design that complements any modern office.',
      price: 79.99,
      rating: 4.6,
      reviews: 892,
      imageUrl: 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=500',
      category: 'Home',
      discount: 10,
      colors: const ['#FFFFFF', '#1A1A2E', '#FFD700'],
    ),
    Product(
      id: 5,
      name: 'Portable Bluetooth Speaker',
      description:
          'Take the party anywhere with this powerful portable speaker. Features 360° surround sound, waterproof design, and 24-hour battery life. Perfect for outdoor adventures.',
      price: 129.99,
      rating: 4.5,
      reviews: 3421,
      imageUrl: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=500',
      category: 'Electronics',
      discount: 25,
      colors: const ['#E94560', '#667EEA', '#1A1A2E'],
    ),
    Product(
      id: 6,
      name: 'Ceramic Coffee Set',
      description:
          'Start your mornings right with this artisanal ceramic coffee set. Includes pour-over dripper, carafe, and two cups. Handmade by skilled artisans with a beautiful matte finish.',
      price: 89.99,
      rating: 4.8,
      reviews: 756,
      imageUrl: 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=500',
      category: 'Home',
      discount: 0,
      colors: const ['#FFFFFF', '#1A1A2E', '#D4A574'],
    ),
  ];
}

