import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/controllers/bottom_nav_controller.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppConstants.whiteColor,
          color: AppConstants.primaryColor,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index){

              bottomNavController.currentIndex.value = index;

          },
          items: [

            Icon(Icons.home,color: AppConstants.whiteColor,
                size: 30
            ),
            Icon(Icons.shopping_bag,color: AppConstants.whiteColor,
                size: 30
            ),
            Icon(Icons.person,color: AppConstants.whiteColor,
                size: 30
            ),






          ]),
      body: bottomNavController.pages[bottomNavController.currentIndex.value],
    ));
  }
}
