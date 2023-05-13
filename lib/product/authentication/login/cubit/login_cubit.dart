import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/authentication/login/service/login_repository.dart';
import '../states/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(const InitialState());

  bool isLoading = false;
  bool isObsecure = true;

  // changeObsecure function is used to change obsecure state of password text field
  void changeObsecure() {
    isObsecure = !isObsecure;
    emit(const ChangeObsecureState());
    emit(const InitialState());
  }

  // login function is used to login to the app
  void login(GlobalKey<FormState> formKey, TextEditingController usernameController, TextEditingController passwordController) async {}

  // _changeLoadingView function is used to change loading state
  void _changeLoadingView() {
    isLoading = !isLoading;
    emit(LoadingState(isLoading));
  }
}
