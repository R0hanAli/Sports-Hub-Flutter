import 'package:firebase_database/firebase_database.dart';
import '../Model/product_model.dart';

class DatabaseHelper {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('Product');

  Future<void> addProduct(ProductModel productModel) {
    return _databaseReference.push().set(productModel.toMap());
  }

  Future<void> deleteProduct(String productId) {
    return _databaseReference.child(productId).remove();
  }

  Query getAllProducts() {
    return _databaseReference.orderByKey();
  }
}
