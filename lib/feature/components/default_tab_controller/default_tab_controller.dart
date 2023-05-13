import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';

class CustomTabController extends StatelessWidget {
  const CustomTabController({super.key, required this.length, this.initialIndex, required this.tabs, required this.onTap});

  final int length;
  final List<Widget> tabs;
  final Function onTap;
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 40),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        height: 30,
        child: DefaultTabController(
          length: length,
          initialIndex: initialIndex ?? 0, // starts from explore index
          child: TabBar(
            onTap: (value) => onTap(value),
            indicatorColor: colorTransparent,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: colorGrey,
            labelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(fontStyle: FontStyle.normal),
            unselectedLabelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(fontStyle: FontStyle.normal),
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}
