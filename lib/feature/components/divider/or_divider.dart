import 'package:flutter/material.dart';
import '../../../core/constants/other/colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _divider(context, true),
        Text('veya', style: Theme.of(context).textTheme.titleSmall),
        _divider(context, false),
      ],
    );
  }

  Container _divider(BuildContext context, bool left) {
    return Container(
      margin: left ? const EdgeInsets.only(right: 15, top: 15, bottom: 15) : const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      color: colorGrey,
      height: 2,
      width: MediaQuery.of(context).size.width / 3.3,
    );
  }
}
