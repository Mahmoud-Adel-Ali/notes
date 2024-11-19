// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomBoxColor extends StatelessWidget {
  const CustomBoxColor({
    Key? key,
    required this.color,
    required this.isActive,
    this.onTap,
  }) : super(key: key);
  final int color;
  final bool isActive;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(color),
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? Colors.yellow : Colors.transparent,
            width: 3,
          ),
        ),
      ),
    );
  }
}
