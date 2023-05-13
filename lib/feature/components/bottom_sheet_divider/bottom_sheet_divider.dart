import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Center(
        child: Divider(
          thickness: 2,
          indent: MediaQuery.of(context).size.width / 2.5,
          endIndent: MediaQuery.of(context).size.width / 2.5,
          color: colorGrey,
        ),
      ),
    );
  }
}
