import '../../../../utils/constants/images_strings.dart';
import '../vertical_product.dart';

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
    title: 'Adidas Running Shoes',
    brand: 'Adidas',
    price: 75.0,
    discountPercent: 30,
    imageUrl: ImagesStrings.productImage2,
    isFavorite: false,
    rating: 4.7,
    reviewCount: 89,
    description: 'Lightweight and comfortable running shoes for daily use.',
    images: [
      ImagesStrings.productImage2,
      ImagesStrings.productImage2,
      ImagesStrings.productImage2,
    ],
    sizes: ['US 6', 'US 7', 'US 8'],
    colors: ['Blue', 'White', 'Grey'],
    stock: 20,
  ),
  VerticalProduct(
    title: 'Puma Sports Sneakers',
    brand: 'Puma',
    price: 65.0,
    discountPercent: 20,
    imageUrl: ImagesStrings.productImage3,
    isFavorite: true,
    rating: 4.3,
    reviewCount: 110,
    description:
        'High-performance sneakers perfect for both gym and casual wear.',
    images: [
      ImagesStrings.productImage3,
      ImagesStrings.productImage3,
      ImagesStrings.productImage3,
    ],
    sizes: ['US 8', 'US 9', 'US 10', 'US 11'],
    colors: ['Red', 'Black'],
    stock: 12,
  ),
];
