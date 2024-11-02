import 'package:sports_hub/Model/product_model.dart';

class AdminProductModel {
  String productId;
  String name;
  double? price;
  String description;
  String category;
  String imageURL;

  AdminProductModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.imageURL,
  });

  ProductModel toProductModel() {
    return ProductModel(
      productId: productId,
      name: name,
      price: price ?? 0.0,
      description: description,
      category: category,
      imageURL: imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'category': category,
      'imageURL': imageURL,
    };
  }

  factory AdminProductModel.fromMap(Map<String, dynamic>? map, String id) {
    if (map == null) {
      throw ArgumentError('Map cannot be null');
    }
    return AdminProductModel(
      productId: id,
      name: map['name'] ?? 'Unknown',
      price: (map['price'] is int)
          ? (map['price'] as int).toDouble()
          : (map['price'] as double?) ?? 0.0,
      description: map['description'] ?? 'No description',
      category: map['category'] ?? 'Uncategorized',
      imageURL: map['imageURL']?.toString() ?? '',
    );
  }
}
