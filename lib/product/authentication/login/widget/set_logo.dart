import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';

class SetLogo extends StatelessWidget {
  const SetLogo({super.key});

  final String _logoLight = 'assets/images/logo/logo-light.png';
  final String _logoDark = 'assets/images/logo/logo-dark.png';

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeModel notifier, child) => Image.asset(
        notifier.isDark ? _logoLight : _logoDark,
        height: 100,
      ),
    );
  }
}
