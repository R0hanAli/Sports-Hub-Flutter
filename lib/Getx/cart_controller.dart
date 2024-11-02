import 'package:get/get.dart';
import '../../Model/product_model.dart';

class CartController extends GetxController {
  var selectedProducts = <ProductModel>[].obs;

  void addProduct(ProductModel product) {
    selectedProducts.add(product);
  }

  double calculateTotalCost() {
    double total = 0.0;
    for (var product in selectedProducts) {
      total += product.price * product.quantity;
    }
    return total;
  }

  void clearCart() {
    selectedProducts.clear();
  }
}
