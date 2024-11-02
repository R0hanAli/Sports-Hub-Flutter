import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Getx/cart_controller.dart';
import '../../Getx/common_layout_controller.dart';
import '../../Model/product_model.dart';
import '../../routes/routes_names.dart';

class Detail extends StatelessWidget {
  final ProductModel product;
  final CartController cartController = Get.put(CartController());
  final TextEditingController quantityController = TextEditingController();

  Detail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: 'Product Details',
      child: Scaffold(
        backgroundColor: const Color(0xFFBf9AED),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    'Product Detail',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.network(
                        product.imageURL,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                              child: Icon(Icons.error, color: Colors.red));
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Price: \$${product.price.toString()}',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quantity :',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 100,
                    child: TextField(
                      controller: quantityController,
                      decoration: InputDecoration(
                        hintText: '',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Description: ${product.description}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  final quantity = quantityController.text;
                  if (quantity.isNotEmpty) {
                    final quantityInt = int.tryParse(quantity);
                    if (quantityInt != null) {
                      final productWithQuantity = ProductModel(
                        name: product.name,
                        price: product.price,
                        category: product.category,
                        description: product.description,
                        imageURL: product.imageURL,
                        quantity: quantityInt,
                      );
                      cartController.addProduct(productWithQuantity);
                      Get.snackbar('Added', 'Added to Bag');
                      Get.toNamed(RouteName.cart);
                    } else {
                      Get.snackbar('Error', 'Please enter a valid quantity');
                    }
                  } else {
                    Get.snackbar('Error', 'Please enter quantity');
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Text('Add to Bag'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
