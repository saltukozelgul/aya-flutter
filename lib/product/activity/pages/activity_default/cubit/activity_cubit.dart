import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/activity/pages/activity_default/service/activity_service.dart';
import '../states/activity_states.dart';

class ActivityCubit extends Cubit<ActivityStates> {
  final ActivityRepository activityRepository;
  int tabIndex = 0;
  int _logsPage = 1;
  bool logLimit = false;
  int _friendsLogsPage = 1;
  bool friendsLogLimit = false;

  ActivityCubit(this.activityRepository) : super(const InitialState());

  String timeSpan(DateTime date) {
    final difference = DateTime.now().difference(date);
    if (difference.inDays > 0) {
      return '${difference.inDays}g';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}s';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}d';
    } else {
      return 'Şimdi';
    }
  }

  void changePage(int index) {
    switch (index) {
      case 0:
        tabIndex = 0;
        getLogs();
        break;
      case 1:
        tabIndex = 1;
        getFriendsLogs();
        break;
      default:
        tabIndex = 0;
        getLogs();
    }
  }

  void getLogs() async {}

  void getMoreLogs() async {}

  num getFullStars(BuildContext context, int star) {
    // The rating is 0 to 10 but the stars are 0 to 5
    double totalStar = star / 2;
    int fullStar = totalStar.toInt();

    return fullStar;
  }

  num getHalfStars(BuildContext context, int star) {
    // The rating is 0 to 10 but the stars are 0 to 5
    double totalStar = star / 2;
    int fullStar = totalStar.toInt();
    double halfStarCount = totalStar - fullStar;

    return halfStarCount;
  }

  void getFriendsLogs() async {}

  void getMoreFriendsLogs() async {}

  void _callState() {}
}
