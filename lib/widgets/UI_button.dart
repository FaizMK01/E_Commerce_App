import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class UiButton extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
   const UiButton({super.key,required this.message,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConstants.primaryColor,
            foregroundColor: AppConstants.whiteColor,
          ),
          child: Text(message),
        ),
      ),
    );
  }
}
