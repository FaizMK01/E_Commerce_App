import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../utils/app_constants.dart';
import '../views/curved_navigation_view.dart';

class LoginController extends GetxController{

  RxBool isPassword = true.obs;

  void loginMethod(String email, String password) async {
    try {
      EasyLoading.show(status: "Please wait...");
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      Get.showSnackbar( const GetSnackBar(
        title: "Success",
        message: "Login Successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 1200),
        backgroundColor: AppConstants.primaryColor,
      )).show();

      // Navigate to BottomNav screen
      Get.offAll(BottomNav());

    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

      if (e.code == 'user-not-found') {
        errorMessage = 'The email provided is not registered.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'The password you provided is incorrect.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else {
        errorMessage = e.message ?? 'An error occurred';
      }

      // Show the error message using GetSnackBar
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 2000),
        backgroundColor: Colors.red,
      ));

    } finally {
      EasyLoading.dismiss();
    }
  }


}

