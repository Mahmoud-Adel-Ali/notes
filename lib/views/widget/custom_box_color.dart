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
        decoration: BoxDecoration(
            color: Color(color),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.yellow,
              width: 1,
            )),
      ),
    );
  }
}
