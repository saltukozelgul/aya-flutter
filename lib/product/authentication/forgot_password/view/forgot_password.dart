import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/core/constants/other/colors.dart';
import 'package:aya_project/core/extension/regex_extensions.dart';
import 'package:aya_project/core/route/app_route.gr.dart';
import 'package:aya_project/feature/components/buttons/icon_buttons.dart';
import 'package:aya_project/feature/components/empty_widget/empty_widget.dart';
import 'package:aya_project/product/authentication/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:aya_project/product/authentication/forgot_password/service/service_repository.dart';
import 'package:aya_project/product/authentication/forgot_password/states/forgot_password_states.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/style/ui_styles.dart';
import '../../../../feature/components/snackbars/custom_snackbars.dart';
import '../../signup/widget/title.dart';
import '../widgets/bottom_svg_image.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(ForgotPasswordRepositoryImpl()),
      child: _buildScaffold(context),
    );
  }

  BlocConsumer _buildScaffold(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
      listenWhen: (previous, current) {
        if (current is LoadingState && previous is ValidateEmailCodeState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarSuccess(context, _Strings().emailSendText));
        }

        if (current is ValidateEmailCodeState && previous is LoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarSuccess(context, _Strings().emailSendText));
        }

        if (current is ValidateEmailCodeState && previous is WrongCodeState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().wrongCode));
        }

        if (current is ChangePasswordState && previous is PasswordsNotMatchState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().passwordsNotEqual));
        }
        return true;
      },
      listener: (context, state) {
        if (state is SendCodeState) {
          if (!state.isMailTaken) {
            ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().mailTakenErrorText));
          }
        } else if (state is ErrorState) {
          if (state.serverError) {
            ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().serverErrorText));
          }
        }

        if (state is ValidateEmailCodeState) {
          if (context.read<ForgotPasswordCubit>().startTimerCheck) {
            context.read<ForgotPasswordCubit>().startTimer(120);
          }
        }

        if (state is SuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarSuccess(context, _Strings().passwordChanged));
          context.router.pushAndPopUntil(LoginRouter(), predicate: (Route<dynamic> route) => route is LoginRouter);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorPrimary,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.65,
                decoration: _ContainerDecoration().stackDecoration(context),
                child: state is SendCodeState
                    ? _sendCodePage(context)
                    : state is ValidateEmailCodeState
                        ? _validateEmailCodePage(context, state)
                        : state is ChangePasswordState
                            ? _changePasswordPage(context, state)
                            : const Center(child: CircularProgressIndicator()),
              ),
              bottomSvgImage(context, _Strings().bottomImagePath),
            ],
          ),
        );
      },
    );
  }

  //* Pages of the forgot password *//
  ListView _changePasswordPage(BuildContext context, ForgotPasswordStates states) {
    return ListView(
      children: [
        CustomIconButtons().popButton(context, colorPrimary),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        title(context, _Strings().title),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        _subtitle(context, _Strings().subtitle3),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        _changePasswordForm(context, states),
        _button(context, _Strings().changePassword, context.read<ForgotPasswordCubit>().changePassword, ''),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
      ],
    );
  }

  ListView _validateEmailCodePage(BuildContext context, ForgotPasswordStates state) {
    return ListView(
      children: [
        CustomIconButtons().popButton(context, colorPrimary),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        title(context, _Strings().title),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        _formattedSubtitle(context),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.04),
        _pinCodeTextField(context),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        _button(context, _Strings().approve, context.read<ForgotPasswordCubit>().approveCode, 'dummyText'),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        state is ValidateEmailCodeState && state.counter == 0 ? _sendMailText(context, state) : _timerText(context),
      ],
    );
  }

  ListView _sendCodePage(BuildContext context) {
    return ListView(
      children: [
        CustomIconButtons().popButton(context, colorPrimary),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        title(context, _Strings().title),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
        _subtitle(context, _Strings().subtitle1),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.04),
        _formSendCode(context),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.01),
        _warningText(context, _Strings().warningText),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.03),
        _button(context, _Strings().approve, context.read<ForgotPasswordCubit>().checkMail, _emailController.text),
      ],
    );
  }

  //* Widgets of the forgot password *//

  Padding _changePasswordForm(BuildContext context, ForgotPasswordStates states) {
    return Padding(
      padding: _PaddingItems().paddingTextField,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _passwordTextField(context),
            EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.01),
            _confirmPasswordTextField(context),
          ],
        ),
      ),
    );
  }

  TextFormField _passwordTextField(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      maxLength: 21,
      maxLines: 1,
      obscureText: true,
      onChanged: (value) => context.read<ForgotPasswordCubit>().backUpPassword = value,
      style: Theme.of(context).textTheme.headlineSmall,
      validator: (value) => (value!.isPasswordValid) ? null : _Strings().passwordError,
      decoration: InputDecoration(
        contentPadding: _PaddingItems().paddingTextField,
        helperText: '',
        counterText: '',
        hintText: _Strings().newPassword,
      ),
    );
  }

  TextFormField _confirmPasswordTextField(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      maxLength: 21,
      maxLines: 1,
      obscureText: true,
      onChanged: (value) => context.read<ForgotPasswordCubit>().backUpPassword2 = value,
      validator: (value) => (value!.isPasswordValid) ? null : _Strings().passwordError,
      style: Theme.of(context).textTheme.headlineSmall,
      decoration: InputDecoration(
        contentPadding: _PaddingItems().paddingTextField,
        helperText: '',
        counterText: '',
        hintText: _Strings().approveNewPassword,
      ),
    );
  }

  Container _pinCodeTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        onChanged: (value) => context.read<ForgotPasswordCubit>().pinCode = value,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: colorTransparent,
        animationType: AnimationType.fade,
        textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(color: colorPrimary, fontSize: 18),
        keyboardAppearance: Brightness.dark,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldWidth: 50,
          inactiveColor: colorGrey,
          selectedColor: colorPrimary,
          activeFillColor: colorWhite,
          selectedFillColor: colorPrimary,
          inactiveFillColor: colorGrey,
          activeColor: colorPrimary,
          borderWidth: 1,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  Text _subtitle(BuildContext context, String subtitle) {
    return Text(subtitle, textAlign: TextAlign.center, style: _subtitleTheme(context));
  }

  Padding _formattedSubtitle(BuildContext context) {
    return Padding(
      padding: _PaddingItems().paddingWarningText,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18),
          children: <TextSpan>[
            TextSpan(text: _Strings().subtitle2Part1),
            TextSpan(text: context.read<ForgotPasswordCubit>().emailText, style: _subtitleTheme(context)?.copyWith(fontStyle: FontStyle.normal)),
            TextSpan(text: _Strings().subtitle2Part2),
          ],
        ),
      ),
    );
  }

  Column _sendMailText(BuildContext context, ForgotPasswordStates state) {
    return Column(
      children: [
        Text(
          _Strings().didYouGetCode,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
        ),
        GestureDetector(
          onTap: () => context.read<ForgotPasswordCubit>().sendCodeAgain(),
          child: Text(
            _Strings().repeatMail,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: colorPrimary, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Text _timerText(BuildContext context) {
    return Text(
      context.read<ForgotPasswordCubit>().startingTime.toString(),
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: colorPrimary),
      textAlign: TextAlign.center,
    );
  }

  Padding _warningText(BuildContext context, String warningText) {
    return Padding(
      padding: _PaddingItems().paddingWarningText,
      child: Text(
        warningText,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontStyle: FontStyle.normal),
      ),
    );
  }

  Padding _formSendCode(BuildContext context) {
    return Padding(
      padding: _PaddingItems().paddingTextField,
      child: TextField(
        controller: _emailController,
        keyboardAppearance: Brightness.dark,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        maxLength: 40,
        style: Theme.of(context).textTheme.headlineSmall,
        decoration: InputDecoration(
          contentPadding: _PaddingItems().paddingTextField,
          counterText: '',
          hintText: _Strings().mailLabel,
          suffixIcon: _IconAttributes().mailIcon,
        ),
      ),
    );
  }

  Padding _button(BuildContext context, String title, Function fun, String funValue) {
    return Padding(
      padding: _PaddingItems().paddingTextField,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton(
          onPressed: () => funValue == '' ? fun(_formKey) : fun(funValue),
          style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: colorWhite, fontSize: 20, wordSpacing: 1, letterSpacing: 2),
          ),
        ),
      ),
    );
  }

  TextStyle? _subtitleTheme(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(shadows: UIStyles().titleShadow(), fontStyle: FontStyle.italic, fontWeight: FontWeight.w300);
  }
}

//** Helper classes for this page */

class _Strings {
  // image path
  String bottomImagePath = 'assets/images/svg/forgot-password.svg';

  // title
  String title = 'Şifremi Unuttum';

  // texts for specific pages
  String subtitle1 = 'Lütfen şifresini yenilemek istediğiniz\n hesabın mail adresini giriniz';
  String subtitle2Part1 = 'Lütfen ';
  String subtitle2Part2 = ' adresine gönderilen 4 haneli kodu giriniz.';
  String subtitle3 = 'Tebrikler! Onaylama işlemi başarılı\n lütfen yeni şifrenizi belirleyiniz.';

  // labels and warnings
  String mailLabel = 'Mail adresiniz';
  String mailTakenErrorText = 'Lütfen geçerli bir mail adresi giriniz';
  String emailSendText = 'Mail adresinize kod gönderildi';
  String warningText = '*Girdiğiniz mail adresine kod gönderileceği için lütfen eksiksiz ve doğru bir mail adresi giriniz.';
  String serverErrorText = 'Sunucu hatası, lütfen daha sonra tekrar deneyiniz.';
  String passwordError = '8 karakterden uzun olmalı, sayı içermeli';

  // button texts
  String sendCode = 'Kodu Gönder';
  String approve = 'Onayla';
  String changePassword = 'Şifremi Değiştir';

  String didYouGetCode = 'Kodun sana ulaşmadı mı?';
  String repeatMail = 'Tekrar Gönder';
  String newPassword = 'Yeni şifreniz';
  String approveNewPassword = 'Yeni şifrenizi onaylayın';
  String passwordChanged = 'Şifreniz başarıyla değiştirildi';

  String wrongCode = 'Yanlış kod girdiniz';

  String passwordsNotEqual = 'Şifreler eşleşmiyor';
}

class _ContainerDecoration {
  BoxDecoration stackDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
    );
  }
}

class _PaddingItems {
  EdgeInsets paddingPopButton = const EdgeInsets.only(left: 20);
  EdgeInsets paddingTextField = const EdgeInsets.symmetric(horizontal: 25);
  EdgeInsets paddingWarningText = const EdgeInsets.symmetric(horizontal: 30);
}

class _IconAttributes {
  final Icon mailIcon = const Icon(Icons.mail);
  final Icon visibilityIcon = const Icon(Icons.visibility);
  final Icon visibilityOffIcon = const Icon(Icons.visibility_off);
}
