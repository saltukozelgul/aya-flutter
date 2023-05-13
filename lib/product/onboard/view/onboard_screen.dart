import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../core/constants/other/colors.dart';
import '../widgets/dot_decorate.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(decoration: _BoxDecorations()._gradient),
          IntroductionScreen(
            done: Text(_Strings()._login),
            next: Text(_Strings()._next),
            skip: Text(_Strings()._jump),
            onDone: () => _navigateToLoginScreen(context),
            onSkip: () => _navigateToLoginScreen(context),
            pages: _introductionPages(context),
            globalBackgroundColor: colorTransparent,
            baseBtnStyle: _Styles()._buttonStyle(context),
            dotsDecorator: dotsDecorator(_introductionPages(context).length),
            showSkipButton: true,
          ),
        ],
      ),
    );
  }

  void _navigateToLoginScreen(BuildContext context) =>
      context.router.replaceNamed('/login');

  List<PageViewModel> _introductionPages(BuildContext context) {
    // todo -> elle vermek yerine dongu kullanilarak dinamiklestirilebilir ama gerek var mi?
    return [
      _pageViewModel(context, _Strings()._introImageAddress[0],
          _Strings()._introTitles[0], _Strings()._introText[0]),
      _pageViewModel(context, _Strings()._introImageAddress[1],
          _Strings()._introTitles[1], _Strings()._introText[1]),
    ];
  }

  PageViewModel _pageViewModel(
      BuildContext context, String imageAddress, String title, String text) {
    return PageViewModel(
      image: Image.asset(imageAddress,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 1.25,
          height: 420),
      title: title,
      body: text,
      decoration: _pageDecoration(context),
    );
  }

  PageDecoration _pageDecoration(BuildContext context) {
    int imageFlex = 3;
    return PageDecoration(
      imageFlex: imageFlex,
      bodyPadding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 20,
          right: MediaQuery.of(context).size.width / 20),
      bodyTextStyle: _Styles()._bodyStyle(context),
      titlePadding: const EdgeInsets.only(bottom: 10),
      titleTextStyle: _Styles()._titleStyle(context),
    );
  }
}

//* helper classes for this page --below *//
// box decoration on this page
class _BoxDecorations {
  final BoxDecoration _gradient = const BoxDecoration(
    gradient: RadialGradient(
        center: Alignment(-0.6, 0.7),
        radius: 0.5,
        colors: <Color>[colorDarkBlue, colorWhite]),
  );
}

// constant strings on this page
class _Strings {
  final String _login = 'Giriş Yap';
  final String _next = 'Sonraki';
  final String _jump = 'Atla';

  final List<String> _introImageAddress = [
    'assets/images/png/com_4.png',
    'assets/images/png/com_3.png',
  ];
  final List<String> _introTitles = [
    'Yardım Et',
    'Yardım Çağrısı Yap',
  ];

  final List<String> _introText = [
    'İhtiyaç sahiplerine tek tıkla ulaş.',
    'İhtiyaçlarını tek tıkla bildir.',
  ];
}

// text styles on this page
class _Styles {
  TextStyle _bodyStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontStyle: FontStyle.italic,
        );
  }

  TextStyle _titleStyle(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge!.copyWith();
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return Theme.of(context).elevatedButtonTheme.style!.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(colorTransparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: const BorderSide(color: colorDarkBlue)),
          ),
          textStyle: MaterialStateProperty.all<TextStyle?>(
              Theme.of(context).textTheme.displaySmall!.copyWith()),
        );
  }
}
