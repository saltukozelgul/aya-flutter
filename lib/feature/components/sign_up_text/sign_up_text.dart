import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';

class SignUpText {
  Column signUp(BuildContext context) {
    String anotherAccountText = 'Henüz bir hesabın yok mu?';
    String signUpText = 'Hemen kayıt ol !';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(anotherAccountText, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "ABeeZee", fontStyle: FontStyle.italic)),
        GestureDetector(
          onTap: () => context.router.pushNamed('/signupOne'),
          child: Text(
            signUpText,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: "ABeeZee", color: colorPrimary, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
