import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/home_repository.dart';
import '../states/home_states.dart';

enum HomeScreenTabs { explore, forYou }

class HomeCubit extends Cubit<HomeStates> {
  //** Static Strings */
  //** Attributes */
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(const InitialState());

  bool isLoaded = false;

  //** Methods */

  // Time span function that show 5min ago 2 min ago
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
}
