import 'package:flutter/material.dart';

class CustomSearchIocn extends StatelessWidget {
  const CustomSearchIocn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.07)
      ),
      child: const Icon(Icons.search,size: 25,),
    );
  }
}