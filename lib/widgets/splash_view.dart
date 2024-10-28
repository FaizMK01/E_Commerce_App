import 'package:e_commerce_app/controllers/bottom_nav_controller.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utils/app_constants.dart';

class SplashViewWidget extends StatelessWidget {
  const SplashViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 10),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            width: double.infinity,
            "images/logo.jpg",fit: BoxFit.cover,),
          const Gap(20),
          Text("""E Commerce for Entrepreneurs Launch Your E-Commerce Startup with Strong Technology and Digital Marketing""",style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 25,
              color: AppConstants.primaryColor
          ),
          ),
          Gap(180),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 160,
                padding: const EdgeInsets.only(right: 20),
                child: ElevatedButton(onPressed: (){
                  Get.offAll(LoginView(),transition: Transition.upToDown,duration: Duration(seconds: 2));

                },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstants.primaryColor,
                      foregroundColor: AppConstants.whiteColor
                  ), child:const Text("Next"),
                ),

              ),
            ],
          )

        ],
      ),
    );
  }
}
