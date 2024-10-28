import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class UiHelperListTile extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final IconData? trailingData;

  const UiHelperListTile({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    this.trailingData



  }
  );

  @override
  State<UiHelperListTile> createState() => _UiHelperListTileState();
}

class _UiHelperListTileState extends State<UiHelperListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppConstants.primaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(
          widget.iconData,
          size: 40,
          color: Colors.white,
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          widget.subtitle, // Using dynamic subtitle
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        trailing:  Icon(
          widget.trailingData,
          size: 20,
          color: Colors.white70,
        ),
      ),
    );
  }
}
