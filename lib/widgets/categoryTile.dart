import 'package:e_commerce_app/views/categories_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_constants.dart';

class CategoriesTile extends StatelessWidget {
  final String image,name;

  const CategoriesTile({Key? key, required this.image,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>CategoriesProducts(category: name));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 100,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 80, fit: BoxFit.cover), // Adjust height
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                  color: AppConstants.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.arrow_forward,
                  size: 20, color: AppConstants.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
