import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  //todo-> iconlara renk verilebilir

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ThemeModel notifier, child) {
        return Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => notifier.isDark ? (notifier.isDark = false) : (notifier.isDark = true),
            icon: Icon(notifier.currentIcon),
          ),
        );
      }),
    );
  }
}
