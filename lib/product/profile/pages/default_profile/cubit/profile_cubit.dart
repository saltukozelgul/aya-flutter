import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aya_project/core/constants/other/colors.dart';
import 'package:aya_project/product/profile/pages/default_profile/service/profile_service.dart';
import 'package:aya_project/product/profile/pages/default_profile/states/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileService profileService;

  ProfileCubit(this.profileService) : super(const ProfileInitialState());

  void logout() async {
    //await profileService.logout();
    emit(const LogOutState());
  }

  void changePage(int index) {
    switch (index) {
      case 0:
        emit(const GeneralPageState());
        break;
      case 1:
        emit(const ProfileLoadingState());
        break;
      case 2:
        emit(const BadgePageState());
        break;
      default:
        emit(const GeneralPageState());
        break;
    }
  }
}
