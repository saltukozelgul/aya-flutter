import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/feature/util/validator/validation_functions.dart';
import 'package:aya_project/product/authentication/signup/service/signup_repository.dart';
import 'package:aya_project/product/authentication/signup/states/signup1_states.dart';

import '../widget/avatar_bottom_sheet.dart';

class SignupCubitOne extends Cubit<SignupStatesOne> {
  final SignupRepository signupRepository;

  String? currentImage;
  bool imagePicked = false;
  bool isValidate = false;
  String? validationMsg;

  SignupCubitOne(this.signupRepository) : super(const InitialState(null, false, false));

  // showImages function is used to show bottom sheet with images
  void showImages(BuildContext context) async {
    final response = await showModalBottomSheet(context: context, builder: (context) => AvatarBottomSheet().circleAvatarGridView());
    currentImage = response as String;
    imagePicked = true;
    emit(InitialState(currentImage, imagePicked, isValidate));
  }

  // buttonAction function is used to check if username is taken or not
  void buttonAction(GlobalKey<FormState> key, TextEditingController usernameController) async {
    String name = usernameController.text;

    if (await signupRepository.isUserExists(name)) {
      emit(const UserExists());
      emit(InitialState(currentImage, imagePicked, isValidate));
    } else {
      String? result = await Validator().validateUsername(name);
      validationMsg = result;

      if (key.currentState != null && key.currentState!.validate() && imagePicked && result == null) {
        emit(const ToNextPage());
        emit(InitialState(currentImage, imagePicked, isValidate));
      } else if (!imagePicked) {
        emit(const ErrorState());
        emit(InitialState(currentImage, imagePicked, isValidate));
      } else {
        isValidate = true;
        emit(InitialState(currentImage, imagePicked, isValidate));
      }
    }
  }
}
