import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Getx/admin_gallery_controller.dart';
import '../../Model/admin_product_model.dart';

class AdminGallery extends StatefulWidget {
  const AdminGallery({Key? key}) : super(key: key);

  @override
  _AdminGalleryState createState() => _AdminGalleryState();
}

class _AdminGalleryState extends State<AdminGallery> {
  final AdminGalleryController _controller = Get.put(AdminGalleryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color(0xFFBf9AED),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          'images/ic_splash.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed('/add_item');
                    },
                    icon: Icon(Icons.add_circle),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Collection',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (_controller.productList.isEmpty) {
                  return Center(child: Text('No products available'));
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: _controller.productList.length,
                  itemBuilder: (context, index) {
                    final product = _controller.productList[index];
                    return ProductItem(
                      product: product,
                      onDelete: () {
                        _controller.deleteProduct(product.productId);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    ),);
  }
}

class ProductItem extends StatelessWidget {
  final AdminProductModel product;
  final VoidCallback onDelete;

  const ProductItem({
    Key? key,
    required this.product,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.imageURL.isNotEmpty
        ? product.imageURL
        : 'https://via.placeholder.com/150';
    return Stack(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback in case image fails to load
                  return Center(child: Icon(Icons.error, color: Colors.red));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('\$${product.price?.toStringAsFixed(2)}'),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ),
      ],
    );
  }
}
