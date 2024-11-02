import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports_hub/Model/product_model.dart';
import '../../Getx/add_item_controller.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final AddProductController _controller = Get.put(AddProductController());
  String? selectedCategory;

  final List<String> categories = [
    'FootBall',
    'Football Helmet',
    'Arm Sleeves',
    'Gloves',
    'Shoulder Pads',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFBf9AED),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.keyboard_backspace, size: 30),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(width: 8),
                      Image.asset('images/ic_splash.png',
                          width: 70, height: 70),
                    ],
                  ),
                ),
                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'New Item',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextField(
                  controller: _controller.nameController,
                  decoration: InputDecoration(
                    hintText: 'Product Name',
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _controller.priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Price',
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Obx(() {
                  return DropdownButtonFormField<String>(
                    value: _controller.selectedCategory.value.isEmpty
                        ? null
                        : _controller.selectedCategory.value,
                    hint: Text('Select Category',
                        style: TextStyle(color: Colors.black)),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (String? newValue) {
                      selectedCategory = newValue;
                      _controller.selectCategory(newValue);
                    },
                    items: categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category, style: TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                  );
                }),
                SizedBox(height: 10),
                TextField(
                  controller: _controller.descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _controller.pickImage(),
                  child: Container(
                    height: 170,
                    color: Colors.white,
                    child: Center(
                      child: Obx(() {
                        return _controller.imageFile.value != null
                            ? Image.file(
                                File(_controller.imageFile.value!.path))
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo_outlined),
                                  Text('Add Image',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ],
                              );
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _controller.uploadImage(),
                  child: Text('Add', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF64438A),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
