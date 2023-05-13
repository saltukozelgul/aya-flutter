import 'package:flutter/material.dart';

class CustomTabTexts extends StatelessWidget {
  const CustomTabTexts({super.key, required this.isLast, required this.title});

  final bool isLast;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 + MediaQuery.of(context).padding.bottom,
      margin: const EdgeInsets.all(0),
      width: double.infinity,
      child: Tab(text: title),
    );
  }
}
