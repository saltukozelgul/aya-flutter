import 'package:flutter/material.dart';

Text title(BuildContext context, String title) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.displayLarge?.copyWith(height: 1),
  );
}
