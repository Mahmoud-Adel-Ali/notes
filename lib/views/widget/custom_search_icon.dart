import 'package:flutter/material.dart';

class CustomIocn extends StatelessWidget {
  const CustomIocn({super.key,required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.07)),
      child:  Icon(
        icon,
        size: 30,
      ),
    );
  }
}
