import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Model/admin_product_model.dart';
import '../databasehelper/databasehelper.dart';

class AdminGalleryController extends GetxController {
  var productList = <AdminProductModel>[].obs;
  var selectedCategory = ''.obs;
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    fetchAndDisplayProducts();
    super.onInit();
  }

  void fetchAndDisplayProducts() {
    databaseHelper.getAllProducts().once().then((snapshot) {
      productList.clear();
      DataSnapshot dataSnapshot = snapshot.snapshot;
      for (var snap in dataSnapshot.children) {
        if (snap.value != null) {
          try {
            Map<String, dynamic> productData =
                Map<String, dynamic>.from(snap.value as Map);
            print('Product Data: $productData');
            AdminProductModel productModel =
                AdminProductModel.fromMap(productData, snap.key!);
            print('Product Image URL: ${productModel.imageURL}');
            productList.add(productModel);
          } catch (e) {
            print('Error processing product data: ${e.toString()}');
          }
        }
      }
    }).catchError((e) {
      print('Error: Failed to fetch products: ${e.toString()}');
    });
  }

  void filterProducts(String category) {
    selectedCategory.value = category;
    update();
  }

  void deleteProduct(String productId) {
    databaseHelper.deleteProduct(productId).then((_) {
      productList.removeWhere((product) => product.productId == productId);
      Get.snackbar('Success', 'Product deleted successfully');
    }).catchError((e) {
      Get.snackbar('Error', 'Failed to delete product: ${e.toString()}');
    });
  }
}
