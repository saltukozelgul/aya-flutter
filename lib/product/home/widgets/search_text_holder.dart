import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../feature/components/empty_widget/empty_widget.dart';

class SearchTextHolder extends StatelessWidget {
  const SearchTextHolder({super.key, required this.index, required this.removeFun, required this.list});
  final Function removeFun;
  final List<String> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        child: Container(
          decoration: BoxDecoration(color: colorDarkThemeBackgroundLight, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              children: [
                InkWell(child: const Icon(Icons.close, color: colorRed, size: 18), onTap: () => removeFun(index)),
                EmptyWidgets().emptyWidgetWidth(15),
                Text(list[index], style: Theme.of(context).textTheme.titleSmall?.copyWith(color: colorWhite)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
