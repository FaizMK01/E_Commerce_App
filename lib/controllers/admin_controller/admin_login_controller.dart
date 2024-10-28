import 'package:e_commerce_app/services/firebase_service.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/views/admin/admin_home.dart';
import 'package:e_commerce_app/views/admin/admin_login.dart';
import 'package:e_commerce_app/views/curved_navigation_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class AdminLoginController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  RxBool isPassword = true.obs;



  void loginMethodAdmin(String email, String password) async {
    // Check if both email and name match the specified values
    if (email != "mkfaiz403@gmail.com" || nameController.text.trim() != "Faiz") {
      Get.showSnackbar(GetSnackBar(
        title: "Access Denied",
        message: "Only the admin with name 'Faiz' and email 'mkfaiz403@gmail.com' can access this login.",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 1200),
        backgroundColor: Colors.red,
      )).show();
      return; // Stop execution if email or name is incorrect
    }

    try {
      EasyLoading.show(status: "Please wait...");
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.showSnackbar(GetSnackBar(
        title: "Admin",
        message: "Login Successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 1200),
        backgroundColor: AppConstants.primaryColor,
      )).show();

      String id = randomAlphaNumeric(10);
      Map<String, dynamic> userInfo = {
        "Name": nameController.text,
        "Email": emailController.text,
        "Id": id,
      };
      await FirebaseService().adminLogin(userInfo, id);
      nameController.clear();
      emailController.clear();
      passwordController.clear();

      // Navigate to the AdminHome screen
      Get.offAll(AdminHome(), transition: Transition.circularReveal, duration: Duration(seconds: 2));
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

      if (e.code == 'wrong-password') {
        errorMessage = 'The password is incorrect.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'No account found for this email.';
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

  void logoutAdmin() async {
    await FirebaseAuth.instance.signOut();
    Get.showSnackbar(const GetSnackBar(
      title: "Admin",
      message: "Logout Successfully",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(milliseconds: 1200),
      backgroundColor: Colors.red,
    ));
    Get.offAll(AdminLogin(), transition: Transition.fadeIn, duration: Duration(seconds: 1));
  }


}
