import 'package:e_commerce_app/controllers/signup_controller.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/widgets/UI_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_constants.dart';



class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final SignUpController signUpController = Get.put(SignUpController());



  // Correctly initialize the form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Lottie.asset(
                  "animations/an2.json",
                  height: 250,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(80),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200], // optional background color
                ),
                child: TextFormField(
                  controller: signUpController.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Name";
                    }
                    return null;
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter your Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none, // Remove default border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey), // Border when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: AppConstants.primaryColor), // Border when focused
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    filled: true,
                    fillColor: Colors.white, // Background color for the field
                  ),
                ),
              ),
              Gap(20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200], // optional background color
                ),
                child: TextFormField(
                  controller: signUpController.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none, // Remove default border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey), // Border when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: AppConstants.primaryColor), // Border when focused
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    filled: true,
                    fillColor: Colors.white, // Background color for the field
                  ),
                ),
              ),
              Gap(20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200], // optional background color
                ),
                child: Obx(() => TextFormField(
                  controller: signUpController.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: signUpController.isPassword.value, // Reactive password visibility
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        signUpController.isPassword.toggle(); // Toggle password visibility
                      },
                      icon: signUpController.isPassword.value
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none, // Remove default border
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey), // Border when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: AppConstants.primaryColor), // Border when focused
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    filled: true,
                    fillColor: Colors.white, // Background color for the field
                  ),
                )),
              ),
              Gap(50),
              UiButton(
                message: "Sign Up",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    String email = signUpController.emailController.text;
                    String password = signUpController.passwordController.text;
                    signUpController.signupMethod(email, password);
                  }
                },
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  Gap(5),
                  TextButton(
                    onPressed: () {
                      Get.to(() => LoginView(),transition:Transition.upToDown,duration: Duration(seconds: 2));
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
