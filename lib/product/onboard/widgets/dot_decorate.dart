import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../core/constants/other/colors.dart';

DotsDecorator dotsDecorator(int length) {
  double dotSizeInactive = 5; // inactive dot size
  double dotSizeActive = 7; // active dot size

  List<Size> size = [];

  for (int i = 0; i < length; i++) {
    size.add(_setDotSize(dotSizeInactive));
  }

  return DotsDecorator(
    color: colorGrey,
    activeColor: colorBlack,
    sizes: size,
    activeSize: _setDotSize(dotSizeActive),
  );
}

Size _setDotSize(double size) => Size.fromRadius(size);
