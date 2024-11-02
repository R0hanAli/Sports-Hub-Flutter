import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../Model/product_model.dart';
import '../databasehelper/databasehelper.dart';

class GalleryController extends GetxController {
  var productList = <ProductModel>[].obs;
  var filteredProducts = <ProductModel>[].obs;
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
        Map<String, dynamic> map =
            Map<String, dynamic>.from(snap.value as Map<Object?, Object?>);
        ProductModel productModel = ProductModel.fromMap(map, snap.key!);
        productList.add(productModel);
      }
      filterProducts(selectedCategory.value);
    });
  }

  void filterProducts(String category) {
    selectedCategory.value = category;
    if (category.isEmpty) {
      filteredProducts.assignAll(productList);
    } else {
      filteredProducts.assignAll(
          productList.where((product) => product.category == category));
    }
    update();
  }

  void deleteProduct(String productId) {
    databaseHelper.deleteProduct(productId).then((_) {
      productList.removeWhere((product) => product.productId == productId);
      filteredProducts.removeWhere((product) => product.productId == productId);
      Get.snackbar('Success', 'Product deleted successfully');
    }).catchError((e) {
      Get.snackbar('Error', 'Failed to delete product: ${e.toString()}');
    });
  }
}
