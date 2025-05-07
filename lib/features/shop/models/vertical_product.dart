class VerticalProduct {
  final String title;
  final String brand;
  final double price;
  final double? discountPercent;
  final String imageUrl;
  final bool isFavorite;
  final double rating;
  final int reviewCount;
  final String description;
  final List<String>? images;
  final List<String>? sizes;
  final List<String>? colors;
  final int stock;

  VerticalProduct({
    required this.title,
    required this.brand,
    required this.price,
    this.discountPercent,
    required this.imageUrl,
    this.isFavorite = false,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.description = '',
    this.images,
    this.sizes,
    this.colors,
    this.stock = 0,
  });

  // Helper getter for discounted price
  double get discountedPrice {
    if (discountPercent == null) return price;
    return price - (price * discountPercent! / 100);
  }

  // Helper getter to check if product is on discount
  bool get hasDiscount => discountPercent != null && discountPercent! > 0;
}
