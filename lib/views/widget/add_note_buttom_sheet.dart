import 'package:flutter/material.dart';
import 'package:notes/views/widget/custom_buttom.dart';
import 'package:notes/views/widget/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextField(
              hint: 'Title',
              maxLine: 1,
            ),
            SizedBox(height: 12),
            CustomTextField(hint: "Content", maxLine: 5),
            SizedBox(height: 12),
            CustomButtom(),
          ],
        ),
      ),
    );
  }
}