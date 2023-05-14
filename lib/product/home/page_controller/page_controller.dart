import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../../core/route/app_route.gr.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
        physics: const NeverScrollableScrollPhysics(),
        routes: const [
          HomePagesRouter(children: [HomeRouter()]),
          CommunityPagesRouter(children: [CommunityScreenRouter()]),
          ProfilePagesRouter(children: [ProfileRouter()]),
        ],
        builder: (context, child, tabController) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: child,
            bottomNavigationBar: _bottomNavigationBar(context),
          );
        });
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.background,
      currentIndex: context.tabsRouter.activeIndex,
      onTap: context.tabsRouter.setActiveIndex,
      elevation: 8,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: colorGrey,
      selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      unselectedIconTheme:
          IconThemeData(color: Theme.of(context).disabledColor),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: _Constants().iconSize),
            label: '',
            tooltip: _Constants().homeToolTip),
        BottomNavigationBarItem(
            icon: Icon(Icons.people, size: _Constants().iconSize),
            label: '',
            tooltip: _Constants().communityToolTip),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, size: _Constants().iconSize),
            label: '',
            tooltip: _Constants().profileToolTip),
      ],
    );
  }
}

class _Constants {
  final String homeToolTip = 'Ana Sayfa';
  final String communityToolTip = 'Komuniteler';
  final String profileToolTip = 'Profil';

  final double iconSize = 25;
}
