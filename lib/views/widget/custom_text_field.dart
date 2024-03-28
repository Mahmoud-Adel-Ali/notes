import 'package:flutter/material.dart';
import 'package:notes/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLine = 1, this.onSaved, this.onChanged});
  final String hint;
  final int maxLine;
  final void Function(String)? onChanged;
  //
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          // mean if value == null take (true) ; if value != null then true
          return "required this textFeild";
        } else {
          return null;
        }
      },
      maxLines: maxLine,
      cursorColor: kprimaryColor,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kprimaryColor),
        hintText: hint,
        hintStyle: const TextStyle(color: kprimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
