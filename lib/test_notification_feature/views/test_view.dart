import 'package:flutter/material.dart';
import 'package:notes/test_notification_feature/views/widgets/test_view_body.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Local Notifiations"),
      ),
      body: const TestViewBody(),
    );
  }
}
