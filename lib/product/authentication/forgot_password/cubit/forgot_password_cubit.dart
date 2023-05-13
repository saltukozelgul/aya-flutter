// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/authentication/forgot_password/service/service_repository.dart';
import 'package:aya_project/product/authentication/forgot_password/states/forgot_password_states.dart';

import '../../../../feature/util/code/code_generator.dart';
import 'dart:async';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates> {
  final ForgotPasswordRepository serviceRepository;

  // Attributes for the cubit state management and the logic of the cubit
  bool isMailTaken = true;
  bool serverError = false;
  bool isLoading = false;
  bool startTimerCheck = false;
  String emailText = '';
  String correctPinCode = '';
  String pinCode = '';
  int startingTime = 120; //

  String backUpPassword = '';
  String backUpPassword2 = '';

  ForgotPasswordCubit(this.serviceRepository) : super(const SendCodeState(false));

  // checks if the email is valid and sends the code to the email
  void checkMail(String email) async {
    // first check if the email is valid
    // then send the email
    isLoading = true;
    emit(LoadingState(isLoading));
    if (await serviceRepository.checkEmailExists(email)) {
      // send email
      correctPinCode = CodeGenerator().generateCode();
      if (await serviceRepository.sendMail(email, correctPinCode)) {
        emailText = email;
        isLoading = false;
        emit(LoadingState(isLoading));
        startTimerCheck = true;
        emit(ValidateEmailCodeState(emailText, startingTime));
      } else {
        serverError = true;
        emit(ErrorState(serverError));
        emit(SendCodeState(isMailTaken));
        serverError = false;
      }
    } else {
      isMailTaken = false;
      emit(LoadingState(isLoading));
      emit(SendCodeState(isMailTaken));
      isMailTaken = true;
    }
  }

  // timer for the code validation page
  void startTimer(int time) {
    startingTime = time;
    emit(const TimerState());
    emit(ValidateEmailCodeState(emailText, startingTime));

    Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (startingTime == 0) {
        timer.cancel();
      } else {
        startingTime--;
        emit(const TimerState());
        emit(ValidateEmailCodeState(emailText, startingTime));
      }
    });
    startTimerCheck = false;
  }

  // sends the code again to the email
  void sendCodeAgain() async {
    isLoading = true;
    emit(LoadingState(isLoading));
    correctPinCode = CodeGenerator().generateCode();
    if (await serviceRepository.sendMail(emailText, correctPinCode)) {
      isLoading = false;
      emit(LoadingState(isLoading));
      startTimerCheck = true;
      emit(ValidateEmailCodeState(emailText, startingTime));
    } else {
      // ! BURASI NASIL CALISACAK EN UFAK FIKRIM YOK, HATA OLDUGU KESIN AMA NASIL BURAYA YONLENDIRECEGIM BILMIYORUM
      serverError = true;
      emit(ErrorState(serverError));
      emit(ValidateEmailCodeState(emailText, startingTime));
      serverError = false;
    }
  }

  // compared the code that user entered with the correct code
  void approveCode(String dummmyString) async {
    if (startingTime != 0 && pinCode == correctPinCode) {
      startingTime = 0;
      emit(const ChangePasswordState());
    } else {
      emit(const WrongCodeState());
      emit(ValidateEmailCodeState(emailText, startingTime));
    }
  }

  // changes the password of the user with the new passwor, last step
  void changePassword(GlobalKey<FormState> key) async {
    if (key.currentState != null && key.currentState!.validate()) {
      if (backUpPassword.trim() == backUpPassword2.trim()) {
        isLoading = true;
        emit(LoadingState(isLoading));
        if (await serviceRepository.changePassword(emailText, backUpPassword)) {
          isLoading = false;
          emit(LoadingState(isLoading));
          emit(const SuccessState());
        } else {
          serverError = true;
          emit(ErrorState(serverError));
          emit(const ChangePasswordState());
          serverError = false;
        }
      } else {
        emit(const PasswordsNotMatchState());
        emit(const ChangePasswordState());
      }
    }
  }
}
