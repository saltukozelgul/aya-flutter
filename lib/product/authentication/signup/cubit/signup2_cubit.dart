import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/authentication/signup/service/signup_repository.dart';

import '../model/name_avatar_model.dart';
import '../states/signup2_states.dart';

class SignupCubitTwo extends Cubit<SignupTwoStates> {
  final SignupRepository signupRepository;

  SignupCubitTwo(this.signupRepository) : super(const InitialState());

  bool isLoading = false;
  bool isObsecure = true;
  bool isValidate = false;

  // changeObsecure function is used to change obsecure state of password text field
  void changeObsecure() {
    isObsecure = !isObsecure;
    emit(const ChangeObsecureState());
    emit(const InitialState());
  }

  void signupButton(
      GlobalKey<FormState> key, NameAvatarModel model, TextEditingController emailController, TextEditingController passwordController) async {
    if (key.currentContext != null && key.currentState!.validate()) {
      // check if email is taken
      if (await signupRepository.isEmailTaken(emailController.text)) {
        emit(const IsEmailExistsState());
        return;
      } else {
        // if email is not taken, then signup
        _changeLoadingView();
        final bool result = await signupRepository.signup(model, emailController.text, passwordController.text);
        if (result) {
          _changeLoadingView();
          emit(const SuccessState());
        } else {
          _changeLoadingView();
          emit(const ErrorState());
        }
      }
    } else {
      // if form is not valid, then show error
      isValidate = true;
      emit(ValidateState(isValidate));
    }
  }

  // change loading view
  void _changeLoadingView() {
    isLoading = !isLoading;
    emit(LoadingState(isLoading));
  }
}
