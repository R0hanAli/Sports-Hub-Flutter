import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_hub/routes/routes_names.dart';
import 'bottom_nav_controller.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  final String title;

  CommonLayout({required this.child, this.title = 'SportsHub'});

  @override
  Widget build(BuildContext context) {
    final BottomNavController _navController = Get.put(BottomNavController());

    return Scaffold(
      body: child,
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: _navController.selectedIndex.value,
          onTap: (index) {
            _navController.changeIndex(index);

            switch (index) {
              case 0:
                Get.toNamed(RouteName.home);
                break;
              case 1:
                Get.toNamed(RouteName.gallery);
                break;
              case 2:
                Get.toNamed(RouteName.cart);
                break;
              case 3:
                Get.toNamed(RouteName.about_us);
                break;
              case 4:
                Get.toNamed(RouteName.contact_us);
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'My Bag',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About Us',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Contact Us',
            ),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
        );
      }),
    );
  }
}
