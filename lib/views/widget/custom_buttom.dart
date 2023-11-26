import 'package:flutter/material.dart';
import 'package:notes/constant.dart';


class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        color: kprimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
          child: Text(
        "Add",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
