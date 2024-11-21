import 'package:flutter/material.dart';
import 'package:notes/test_notification_feature/views/widgets/my_button.dart';

class TestViewBody extends StatelessWidget {
  const TestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(
            onPressed: () {},
            title: "Basic Notification",
          ),
          const SizedBox(height: 40),
          MyButton(
            onPressed: () {},
            title: "Repeated Notification",
          ),
          const SizedBox(height: 40),
          MyButton(
            onPressed: () {},
            title: "Scheduled Notification",
          ),
          const SizedBox(height: 40),
          IconButton(
            onPressed: () {},
            icon: const Text("Cancel all"),
          ),
        ],
      ),
    );
  }
}
