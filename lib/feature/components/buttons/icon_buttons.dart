import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aya_project/core/constants/other/colors.dart';

class CustomIconButtons {
  Widget popButton(BuildContext context, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: color),
        onPressed: () => context.router.pop(),
      ),
    );
  }

  Widget popButtonUntilActive(BuildContext context, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: color),
        onPressed: () => context.router.popUntil((route) => route.isFirst),
      ),
    );
  }

  Widget nextButton(BuildContext context, String path) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(Icons.arrow_forward_ios, color: colorPrimary),
        onPressed: () {},
      ),
    );
  }
}
