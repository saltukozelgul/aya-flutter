import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';

class CustomTitleDivider extends StatelessWidget {
  const CustomTitleDivider({super.key, required this.title, this.seeAll, this.fun});
  final String title;
  final Function? fun;
  final String? seeAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            InkWell(
              onTap: () => fun == null ? {} : fun!(),
              child: Text(seeAll ?? '', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: colorGrey)),
            ),
          ],
        ),
        Divider(color: Theme.of(context).disabledColor, thickness: 1),
      ],
    );
  }
}
