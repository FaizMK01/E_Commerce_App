import 'dart:math';

import 'package:e_commerce_app/services/firebase_service.dart';
import 'package:e_commerce_app/services/shared_pref.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/views/curved_navigation_view.dart';
import 'package:e_commerce_app/views/sign_up_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import '../views/sign_up_view.dart';

class SignUpController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  RxBool isPassword = true.obs;



  void signupMethod(String email, String password) async {
    try {
      EasyLoading.show(status: "Please wait...");
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      Get.showSnackbar(GetSnackBar(
        title: "Success",
        message: "Registered Successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 1200),
        backgroundColor: AppConstants.primaryColor,
      )).show();
      String id = randomAlphaNumeric(10);
      await SharedPreferenceHelper().saveUserId(id);
      await SharedPreferenceHelper().saveUserName(nameController.text);
      await SharedPreferenceHelper().saveUserEmail(emailController.text);


      Map<String,dynamic> userInfo = {
        "Name":nameController.text,
        "Email":emailController.text,
        "Id":id
      };
     await FirebaseService().addUser(userInfo, id);



      // Navigate to BottomNav screen
      Get.offAll(BottomNav(),transition:Transition.upToDown,duration: Duration(seconds: 2));

    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else {
        errorMessage = e.message ?? 'An error occurred';
      }

      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 1200),
        backgroundColor: Colors.red,

      )).show();

    } finally {
      EasyLoading.dismiss();
    }
  }

}
