import 'package:e_commerce_app/services/stripe_service.dart';
import 'package:e_commerce_app/views/admin/admin_home.dart';
import 'package:e_commerce_app/views/admin/admin_login.dart';
import 'package:e_commerce_app/views/curved_navigation_view.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: BottomNav(),
     // home: LoginView(),
     // home: AddProduct(),
     // home: SignUpView(),
     // home: AllOrders(),
     // home: AdminHome(),
   //  home: AdminLogin(),
      home: SplashView(),


      builder: EasyLoading.init(),
    );
  }
}
