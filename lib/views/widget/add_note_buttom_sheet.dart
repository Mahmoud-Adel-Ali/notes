// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:notes/views/widget/custom_buttom.dart';
import 'package:notes/views/widget/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 16),
          CustomTextField(
            hint: 'Title',
            maxLine: 1,
          ),
          SizedBox(height: 12),
          CustomTextField(hint: "Content", maxLine: 5),
          SizedBox(height: 32),
          // Spacer(),
          CustomButtom(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}