class ProductModel {
  String? productId;
  String name;
  int quantity;
  String category;
  double price;
  String description;
  String imageURL;

  ProductModel({
    this.productId,
    this.quantity = 1,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imageURL,
  });

  void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'description': description,
      'imageURL': imageURL,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map, String productId) {
    return ProductModel(
      productId: productId,
      name: map['name'] ?? 'Unknown',
      category: map['category'] ?? 'Uncategorized',
      price: (map['price'] is double)
          ? map['price']
          : (map['price'] as num).toDouble(),
      description: map['description'] ?? 'No description',
      imageURL: map['imageURL'] ?? '',
    );
  }
}
