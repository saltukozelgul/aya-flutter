// ignore_for_file: unnecessary_null_comparison, prefer_null_aware_operators

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/community/pages/community_default_page/service/default_community_service.dart';
import 'package:aya_project/product/community/pages/community_default_page/states/default_community_states.dart';

enum DefaultCommunityTabs { discover, myCommunities }

class DefaultCommunityCubit extends Cubit<DefaultCommunityStates> {
  final DefaultCommunityService defaultCommunityService;
  final BuildContext context;

  late Timer timer;
  String searchText = '';
  bool isLoaded = false;
  bool myCommunitiesLimit = false;
  bool discoverCommunitiesLimit = false;
  int tabIndex = 0;
  int myCommunitiesPage = 1;
  int discoverCommunitiesPage = 1;
  List<int> randomNumbers = [];

  DefaultCommunityCubit(this.defaultCommunityService, this.context) : super(const DefaultCommunityLoadingStates());

  void changePage(int index) {
    switch (index) {
      case 0:
        emit(DefaultCommunityDiscoverStates());
        break;
      case 1:
        emit(DefaultCommunityMyCommunitiesStates());
        break;
      default:
        tabIndex = 0;
        emit(DefaultCommunityDiscoverStates());
    }
  }

  void getMyCommunities() async {}

  void getMoreMyCommunities() async {}

  void _getDiscoverCommunities() async {}

  void getMoreDiscoverCommunities() async {}

  // void searchCommunity(String query) {
  //   List<CommunityModel> communities = myCommunities.where((element) => element.community_name!.toLowerCase().contains(query.toLowerCase())).toList();
  //   emit(DefaultCommunityMyCommunitiesStates(communities));
  // }

  void _addRandomNumbers() {}

  int randomInt(int min, int max) => (min + (max - min) * Random().nextInt(100) ~/ 100);
}
