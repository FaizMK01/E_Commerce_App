import 'package:e_commerce_app/controllers/admin_controller/admin_login_controller.dart';
import 'package:e_commerce_app/views/admin/add_product.dart';
import 'package:e_commerce_app/views/admin/all_orders.dart';
import 'package:e_commerce_app/widgets/UI_button.dart';
import 'package:e_commerce_app/widgets/ui_helper_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/app_constants.dart';


class AdminHome extends StatelessWidget {
   AdminHome({super.key});

  final adminLoginController = Get.put(AdminLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Admin Home",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppConstants.whiteColor
          ),
        ),
        centerTitle: true, // Centers the title
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        adminLoginController.logoutAdmin();


      },
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: AppConstants.whiteColor,


        child: Icon(Icons.logout),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            // Add Product Card
            GestureDetector(
              onTap: () {
                Get.to(AddProduct(),transition: Transition.downToUp,duration: Duration(seconds: 1));
              },
              child: UiHelperListTile(iconData: Icons.add,
                  title: "Add Product",
                  subtitle: "Manage your products",
                trailingData: Icons.arrow_forward_ios,
              )
            ),

            // All Orders Card
            GestureDetector(
              onTap: () {
                Get.to(AllOrders(),transition: Transition.downToUp,duration: Duration(seconds: 1));

              },
              child: UiHelperListTile(iconData: Icons.shopping_bag,
                  title: "All Orders",
                  subtitle: "View and manage orders",
                trailingData: Icons.arrow_forward_ios,
              )
            ),
          ],
        ),
      ),
    );
  }
}
