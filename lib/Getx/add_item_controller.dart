import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports_hub/Model/admin_product_model.dart';
import '../databasehelper/databasehelper.dart';

class AddProductController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  var imageFile = Rx<XFile?>(null);
  var selectedCategory = ''.obs;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  void selectCategory(String? category) {
    if (category != null) {
      selectedCategory.value = category;
    }
  }

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile.value = pickedFile;
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future<void> uploadImage() async {
    if (imageFile.value == null) {
      Get.snackbar('Error', 'Please select an image');
      return;
    }

    final file = imageFile.value!;
    final fileName = 'images/${DateTime.now().toString()}';
    final storageRef = _storage.ref().child(fileName);

    try {
      await storageRef.putFile(File(file.path));
      final imageUrl = await storageRef.getDownloadURL();

      saveProductToDatabase(imageUrl);
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to upload image');
    }
  }

  double? parsePrice(String priceStr) {
    try {
      return double.tryParse(priceStr);
    } catch (e) {
      return null;
    }
  }

  void saveProductToDatabase(String imageUrl) {
    final adminProduct = AdminProductModel(
      productId: '',
      name: nameController.text,
      price: parsePrice(priceController.text),
      description: descriptionController.text,
      category: selectedCategory.value,
      imageURL: imageUrl,
    );

    final product = adminProduct.toProductModel();

    _databaseHelper.addProduct(product).then((_) {
      Get.snackbar('Success', 'Product added successfully');
      nameController.clear();
      priceController.clear();
      descriptionController.clear();
      imageFile.value = null;
      Get.toNamed('/admin_gallery');
    }).catchError((e) {
      Get.snackbar('Error', 'Failed to add product: ${e.toString()}');
    });
  }
}
