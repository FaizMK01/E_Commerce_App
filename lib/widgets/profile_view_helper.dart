import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants.dart';


class ProfileViewHelper extends StatefulWidget {
  final IconData leadIcon;
  final String title,subtitle;
  const ProfileViewHelper({super.key,required this.leadIcon,required this.title,required this.subtitle});

  @override
  State<ProfileViewHelper> createState() => _ProfileViewHelperState();
}

class _ProfileViewHelperState extends State<ProfileViewHelper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppConstants.primaryColor
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        leading:  Icon(widget.leadIcon, size: 40, color: Colors.tealAccent), // Leading icon
        title:  Text(
          widget.title, // Label
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white60 // Style for "Name" label
          ),
        ),
        subtitle: Text(
          widget.subtitle ?? 'User Name', // Display the name or fallback text
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
