import 'package:e_commerce_app/features/shop/models/vertical_product.dart';

import '../../../../utils/constants/images_strings.dart';

List<VerticalProduct> verticalProductsData = [
  VerticalProduct(
    title: 'Green Nike Shoe',
    brand: 'Nike',
    price: 60.0,
    discountPercent: 25,
    imageUrl: ImagesStrings.productImage1,
    isFavorite: true,
    rating: 4.5,
    reviewCount: 120,
    description: 'Premium quality running shoes with air cushion technology',
    images: [
      ImagesStrings.productImage1,
      ImagesStrings.productImage1,
      ImagesStrings.productImage1,
    ],
    sizes: ['US 7', 'US 8', 'US 9', 'US 10'],
    colors: ['Green', 'Black', 'White'],
    stock: 15,
  ),
  VerticalProduct(
    title: 'Green Nike Shoe',
    brand: 'Nike',
    price: 60.0,
    discountPercent: 25,
    imageUrl: ImagesStrings.productImage2,
    isFavorite: true,
    rating: 4.5,
    reviewCount: 120,
    description: 'Premium quality running shoes with air cushion technology',
    images: [
      ImagesStrings.productImage2,
      ImagesStrings.productImage2,
      ImagesStrings.productImage2,
    ],
    sizes: ['US 7', 'US 8', 'US 9', 'US 10'],
    colors: ['Green', 'Black', 'White'],
    stock: 15,
  ),
];
