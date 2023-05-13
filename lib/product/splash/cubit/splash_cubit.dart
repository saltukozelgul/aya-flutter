import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/feature/util/time/future_duration.dart';
import 'package:aya_project/product/splash/service/splash_repository.dart';
import '../states/splash_states.dart';

// cubit for splash screen -> check user logged in or not
class SplashCubit extends Cubit<SplashStates> {
  final SplashRepository _splashRepository;
  SplashCubit(this._splashRepository) : super(const InitialState());

  // check user logged in or not
  Future<void> checkUserLoggedIn() async {
    emit(const UserNotLoggedInState());
  }
}
