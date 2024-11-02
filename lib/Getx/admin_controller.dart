import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/routes_names.dart';

class AdminController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    if (email == 'adminrohan@gmail.com' && password == '123456') {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar('Success', 'Login Successfully');
        Get.toNamed(RouteName.admin_gallery);
      } catch (e) {
        print('ErrorLogin failed: ${e.toString()}');
      }
    }
  }
}
