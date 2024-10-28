import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:e_commerce_app/widgets/splash_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteColor,
      body: SplashViewWidget()
    );
  }
}
