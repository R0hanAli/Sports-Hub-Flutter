import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_hub/Getx/common_layout_controller.dart';
import '../../Getx/gallery_controller.dart';
import '../../Model/product_model.dart';
import 'detail.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final GalleryController _controller = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return CommonLayout(child: SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFBf9AED),
        body: Column(
          children: [
            const Padding(
              padding:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Center(
                  child: Text(
                    'Product Type',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10.0, right: 10, bottom: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Obx(() {
                    return DropdownButton<String>(
                      hint: Text('Select Category'),
                      value: _controller.selectedCategory.value.isEmpty
                          ? null
                          : _controller.selectedCategory.value,
                      items: <String>[
                        'FootBall',
                        'Football Helmet',
                        'Arm Sleeves',
                        'Gloves',
                        'Shoulder Pads'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          _controller.filterProducts(newValue);
                        }
                      },
                      isExpanded: true,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
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
                    itemCount: _controller.filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _controller.filteredProducts[index];
                      return ProductItem(
                        product: product,
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.imageURL.isNotEmpty
        ? product.imageURL
        : 'https://via.placeholder.com/150';

    return GestureDetector(
      onTap: () {
        Get.to(() => Detail(product: product));
      },
      child: Stack(
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
                  child: Text('\$${product.price.toStringAsFixed(2)}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
