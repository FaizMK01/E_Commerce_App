import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class UiHelperTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  const UiHelperTextFormField({super.key,
    required this.controller,
    required this.hintText,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200], // optional background color
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Your Name";
          }
          return null;
        },
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
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
    );
  }
}
