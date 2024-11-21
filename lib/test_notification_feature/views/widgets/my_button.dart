import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title, this.onPressed});
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      color: Colors.indigo.shade900,
      onPressed: onPressed ?? () {},
      child: Row(
        children: [
          const Icon(Icons.notifications_active),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
