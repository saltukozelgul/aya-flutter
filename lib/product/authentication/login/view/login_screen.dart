import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/core/route/app_route.gr.dart';
import 'package:aya_project/feature/components/empty_widget/empty_widget.dart';
import 'package:aya_project/feature/components/sign_up_text/sign_up_text.dart';
import 'package:aya_project/feature/components/snackbars/custom_snackbars.dart';
import 'package:aya_project/product/authentication/login/cubit/login_cubit.dart';
import 'package:aya_project/product/authentication/login/service/login_repository.dart';
import 'package:aya_project/product/authentication/login/states/login_states.dart';
import 'package:aya_project/product/authentication/login/widget/set_logo.dart';
import '../../../../core/constants/other/colors.dart';
import '../../../../feature/components/divider/or_divider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepositoryImpl()),
      child: _buildScaffold(context),
    );
  }

  BlocConsumer _buildScaffold(context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listenWhen: (previous, current) {
        if (current is LoadingState && (previous is InitialState || previous is ErrorState)) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarCircularIndicator(context));
        } else if (current is LoadingState && previous is LoadingState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } else if (current is ErrorState && previous is LoadingState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        } else if (current is LoginSuccess && previous is LoadingState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
        return true;
      },
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().errorText));
        } else if (state is LoginSuccess) {
          context.router.push(HomeControllerRouter());
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: _PaddingAttributes().pagePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //const ChangeThemeButton(),

                EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.04),
                const SetLogo(),
                _textFieldForm(context, state),
                EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.15),
                Column(
                  children: [
                    _signInButton(context, state),
                    EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.03),
                    const OrDivider(),
                    EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.03),
                    SignUpText().signUp(context),
                    EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.01),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox _signInButton(BuildContext context, LoginStates state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () => context.router.push(const HomeControllerRouter()),
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Text(
          _Strings().login,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: colorWhite, fontSize: 20, wordSpacing: 1, letterSpacing: 2),
        ),
      ),
    );
  }

  Form _textFieldForm(BuildContext context, LoginStates state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _usernameTextField(context, state),
          EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
          _passwordTextField(context, state),
          _forgotPassword(context)
        ],
      ),
    );
  }

  Align _forgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.router.pushNamed('/forgotPassword'),
        child: Text(_Strings().forgotPassword, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: colorGrey, fontStyle: FontStyle.italic)),
      ),
    );
  }

  TextFormField _usernameTextField(BuildContext context, LoginStates state) {
    return TextFormField(
      controller: _usernameController,
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      maxLength: 21,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
      decoration: InputDecoration(
        counterText: '',
        labelText: _Strings().usernameLabel,
        hintText: _Strings().usernameLabel,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic, color: colorGrey),
        suffixIcon: _IconAttributes().usernameIcon,
      ),
    );
  }

  TextFormField _passwordTextField(BuildContext context, LoginStates state) {
    return TextFormField(
      controller: _passwordController,
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      maxLength: 21,
      maxLines: 1,
      obscureText: context.read<LoginCubit>().isObsecure,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
      decoration: InputDecoration(
        counterText: '',
        labelText: _Strings().passwordLabel,
        hintText: _Strings().passwordLabel,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic, color: colorGrey),
        suffixIcon: _passwordVisibility(context),
      ),
    );
  }

  IconButton _passwordVisibility(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: context.read<LoginCubit>().isObsecure ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
      onPressed: () => context.read<LoginCubit>().changeObsecure(),
    );
  }
}

//* Classes for this page *//
class _PaddingAttributes {
  EdgeInsets pagePadding = EdgeInsets.symmetric(vertical: _PaddingValues().pagePadding, horizontal: _PaddingValues().pagePadding);
}

class _PaddingValues {
  double pagePadding = 40;
}

class _Strings {
  String forgotPassword = 'Şifremi unuttum ?';
  String usernameLabel = 'Kullanıcı Adı';
  String passwordLabel = 'Şifre';
  String login = 'Giriş Yap';
  String errorText = 'Kullanıcı adı veya şifre hatalı';
}

class _IconAttributes {
  Icon usernameIcon = const Icon(Icons.person_outline);
  Icon passwordIcon = const Icon(Icons.lock);
}
