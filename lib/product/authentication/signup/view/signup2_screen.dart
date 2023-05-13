import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/core/constants/other/colors.dart';
import 'package:aya_project/core/route/app_route.gr.dart';
import 'package:aya_project/feature/components/empty_widget/empty_widget.dart';
import 'package:aya_project/product/authentication/signup/service/signup_repository.dart';
import 'package:aya_project/product/authentication/signup/states/signup2_states.dart';
import 'package:aya_project/product/authentication/signup/widget/bottom_image.dart';
import 'package:aya_project/core/extension/regex_extensions.dart';

import '../../../../feature/components/buttons/icon_buttons.dart';
import '../../../../feature/components/snackbars/custom_snackbars.dart';
import '../cubit/signup2_cubit.dart';
import '../model/name_avatar_model.dart';
import '../widget/title.dart';

class SignupScreenTwo extends StatelessWidget {
  SignupScreenTwo({super.key, required this.model});
  final NameAvatarModel model;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubitTwo(SignupRepositoryImpl()),
      child: _buildScaffold(context),
    );
  }

  BlocConsumer _buildScaffold(BuildContext context) {
    return BlocConsumer<SignupCubitTwo, SignupTwoStates>(
      listenWhen: (previous, current) {
        if (current is LoadingState && (previous is InitialState || previous is ErrorState || previous is ValidateState)) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarCircularIndicator(context));
        } else if (current is LoadingState && previous is LoadingState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } else if (current is ErrorState && previous is LoadingState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } else if (current is SuccessState && previous is LoadingState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
        return true;
      },
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().errorText));
        } else if (state is SuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarSuccess(context, _Strings().successText));
          context.router.pushAndPopUntil(LoginRouter(), predicate: (Route<dynamic> route) => route.isFirst);
        } else if (state is IsEmailExistsState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().emailExists));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorPrimary,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.50,
                decoration: _ContainerDecoration().stackDecoration(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.04),
                    _popButton(context),
                    EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.01),
                    title(context, _Strings().title),
                    EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.025),
                    _buildForm(context, state),
                    EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.025),
                    _signupButton(context),
                    //_returnLoginPage(context),
                  ],
                ),
              ),
              bottomImage(context, _Strings().bottomImgPath),
            ],
          ),
        );
      },
    );
  }

  // Column _returnLoginPage(BuildContext context) {
  //   return Column(
  //     children: [
  //       const OrDivider(),
  //       GestureDetector(
  //         onTap: () => context.router.pushNamed('/login'),
  //         child: Text(
  //           _Strings().logIn,
  //           style: Theme.of(context)
  //               .textTheme
  //               .headlineSmall
  //               ?.copyWith(fontFamily: "ABeeZee", color: colorPrimary, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Container _signupButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      padding: _PaddingItems().paddingTextField,
      child: ElevatedButton(
        onPressed: () => context.read<SignupCubitTwo>().signupButton(_formKey, model, _emailController, _passwordController),
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Text(
          _Strings().buttonText,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: colorWhite, fontSize: 20, wordSpacing: 1, letterSpacing: 2),
        ),
      ),
    );
  }

  Form _buildForm(BuildContext context, SignupTwoStates state) {
    return Form(
      key: _formKey,
      autovalidateMode: state is ValidateState ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled) : AutovalidateMode.disabled,
      child: Column(children: [
        _email(context),
        EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.005),
        _password(context),
      ]),
    );
  }

  Padding _email(BuildContext context) {
    return Padding(
      padding: _PaddingItems().paddingTextField,
      child: TextFormField(
        controller: _emailController,
        keyboardAppearance: Brightness.dark,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        maxLength: 35,
        style: Theme.of(context).textTheme.headlineSmall,
        validator: (value) => (value!.isEmailValid) ? null : _Strings().mailError,
        decoration: InputDecoration(
          contentPadding: _PaddingItems().paddingTextField,
          helperText: ' ',
          counterText: '',
          labelText: _Strings().mailLabel,
          hintText: _Strings().mailLabel,
          suffixIcon: _IconAttributes().mailIcon,
        ),
      ),
    );
  }

  Padding _password(BuildContext context) {
    return Padding(
      padding: _PaddingItems().paddingTextField,
      child: TextFormField(
        controller: _passwordController,
        keyboardAppearance: Brightness.dark,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        maxLength: 21,
        style: Theme.of(context).textTheme.headlineSmall,
        obscureText: context.read<SignupCubitTwo>().isObsecure,
        validator: (value) => (value!.isPasswordValid) ? null : _Strings().passwordError,
        decoration: InputDecoration(
          contentPadding: _PaddingItems().paddingTextField,
          helperText: ' ',
          counterText: '',
          hintText: _Strings().passwordLabel,
          suffixIcon: IconButton(
            onPressed: () => context.read<SignupCubitTwo>().changeObsecure(),
            icon: context.read<SignupCubitTwo>().isObsecure ? _IconAttributes().visibilityIcon : _IconAttributes().visibilityOffIcon,
          ),
        ),
      ),
    );
  }

  Padding _popButton(BuildContext context) => Padding(
        padding: _PaddingItems().paddingPopButton,
        child: CustomIconButtons().popButton(context, colorPrimary),
      );
}

//* Classes for this page *//

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

class _Strings {
  final String title = 'Sinema tutkunların buluşma\n noktasına son 1 adım!';
  final String mailLabel = 'Mail adresiniz';
  final String passwordLabel = 'Şifreniz';
  final String buttonText = 'Hesap Oluştur';
  final String logIn = 'Giriş Yap';
  final String bottomImgPath = 'assets/images/png/register-background-2.png';
  final String errorText = 'Gecersiz mail adresi veya şifre';
  final String successText = 'Hesabınız başarıyla oluşturuldu.';
  final String mailError = 'Gecersiz mail adresi';
  final String passwordError = '8 karakterden uzun olmalı, sayı içermeli';
  final String emailExists = 'Bu mail adresi zaten kullanımda';
}

class _IconAttributes {
  final Icon mailIcon = const Icon(Icons.mail_outline);
  final Icon visibilityIcon = const Icon(Icons.visibility);
  final Icon visibilityOffIcon = const Icon(Icons.visibility_off);
}

class _PaddingItems {
  EdgeInsets paddingPopButton = const EdgeInsets.only(left: 20);
  EdgeInsets paddingTextField = const EdgeInsets.symmetric(horizontal: 25);
}
