import 'package:e_commerce_app/controllers/login_controller.dart';
import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/views/sign_up_view.dart';
import 'package:e_commerce_app/widgets/UI_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});

  final TextEditingController emailController =  TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
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
              Gap(80), // Reduce the gap for balance
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200], // optional background color
                ),
                child: TextFormField(
                  controller: emailController,
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
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: loginController.isPassword.value, // Reactive password visibility
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginController.isPassword.toggle(); // Toggle password visibility
                      },
                      icon: loginController.isPassword.value
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
              Padding(
                padding: const EdgeInsets.only(left: 230),
                child: TextButton(onPressed: () {}, child: Text("Forgot Password")),
              ),
              Gap(20),
              UiButton(message: "Login",onTap: (){

                if(_formKey.currentState!.validate()){
                  String email = emailController.text;
                  String password = passwordController.text;
                  loginController.loginMethod(email, password);

                }

              },
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  Gap(5),
                  TextButton(
                    onPressed: () {
                      Get.to(()=>SignUpView(),transition:Transition.upToDown,duration: Duration(seconds: 2));
                    },
                    child: Text("Sign Up"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

