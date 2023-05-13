import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/core/constants/other/colors.dart';
import 'package:aya_project/feature/components/empty_widget/empty_widget.dart';
import 'package:aya_project/feature/components/snackbars/custom_snackbars.dart';
import 'package:aya_project/product/authentication/signup/cubit/signup1_cubit.dart';
import 'package:aya_project/product/authentication/signup/model/name_avatar_model.dart';
import 'package:aya_project/product/authentication/signup/service/signup_repository.dart';

import '../../../../core/route/app_route.gr.dart';
import '../../../../feature/components/buttons/icon_buttons.dart';
import '../states/signup1_states.dart';
import '../widget/bottom_image.dart';
import '../widget/title.dart';

class SignupScreenOne extends StatelessWidget {
  SignupScreenOne({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubitOne(SignupRepositoryImpl()),
      child: _buildScaffold(context),
    );
  }

  BlocConsumer _buildScaffold(BuildContext context) {
    return BlocConsumer<SignupCubitOne, SignupStatesOne>(
      listener: (context, state) {
        if (state is ToNextPage) {
          context.router.push(
            SignupTwoRouter(
              model: NameAvatarModel(username: _usernameController.text, avatarPath: context.read<SignupCubitOne>().currentImage ?? ''),
            ),
          );
        } else if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().avatarError));
        } else if (state is UserExists) {
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackbars().snackBarError(context, _Strings().userTaken));
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: colorPrimary,
          body: SizedBox(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.50,
                  decoration: _ContainerDecoration().stackDecoration(context),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _popButton(context),
                      title(context, _Strings().title),
                      EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
                      _circleAvatarPicker(context, state),
                      EmptyWidgets().emptyWidgetHeight(MediaQuery.of(context).size.height * 0.02),
                      _form(context, state),
                      _nextButton(context), // todo -> icon button degil elevated button olsun
                    ],
                  ),
                ),
                bottomImage(context, _Strings().bottomImgPath),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _form(BuildContext context, SignupStatesOne state) {
    return Padding(
      padding: _PaddingItems().paddingTextField,
      child: Form(
        key: _formKey,
        autovalidateMode: context.read<SignupCubitOne>().isValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: TextFormField(
          controller: _usernameController,
          keyboardAppearance: Brightness.dark,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          maxLength: 21,
          validator: (val) => context.read<SignupCubitOne>().validationMsg,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          decoration: InputDecoration(
            contentPadding: _PaddingItems().paddingTextField,
            helperText: ' ',
            counterText: '',
            labelText: _Strings().usernameLabel,
            hintText: _Strings().usernameLabel,
            suffixIcon: _IconAttributes().usernameIcon,
          ),
        ),
      ),
    );
  }

  // todo -> default avatar eklenecek
  GestureDetector _circleAvatarPicker(BuildContext context, SignupStatesOne state) {
    return GestureDetector(
      onTap: () => context.read<SignupCubitOne>().showImages(context),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 6,
        decoration: _ContainerDecoration().circleAvatarDecoration(context),
        child: context.read<SignupCubitOne>().imagePicked
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: Image.network(context.read<SignupCubitOne>().currentImage ?? '', fit: BoxFit.contain).image),
                ),
              )
            : IconButton(icon: _IconAttributes().pickAvatarIcon, onPressed: () => context.read<SignupCubitOne>().showImages(context)),
      ),
    );
  }

  Padding _nextButton(BuildContext context) {
    return Padding(
      padding: _PaddingItems().paddingNextButton,
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          icon: _IconAttributes().nextPageIcon,
          onPressed: () => context.read<SignupCubitOne>().buttonAction(_formKey, _usernameController),
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

  BoxDecoration circleAvatarDecoration(BuildContext context) {
    return BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor);
  }
}

class _Strings {
  final String title = 'Sinema dünyası\n Moviote ile daha da keyifli';
  final String usernameLabel = 'Kullanıcı adınız';
  final String bottomImgPath = 'assets/images/png/register-background.png';
  final String avatarError = 'Lütfen bir avatar seçiniz';
  final String userTaken = ' Bu kullanıcı adı zaten alınmış';
}

class _IconAttributes {
  final Icon usernameIcon = const Icon(Icons.person_outline);
  final Icon pickAvatarIcon = const Icon(Icons.add, color: colorWhite, size: 75);
  final Icon nextPageIcon = const Icon(Icons.arrow_forward_ios, color: colorPrimary);
}

class _PaddingItems {
  EdgeInsets paddingPopButton = const EdgeInsets.only(left: 20);
  EdgeInsets paddingNextButton = const EdgeInsets.only(right: 25, top: 0);
  EdgeInsets paddingTextField = const EdgeInsets.symmetric(horizontal: 25);
}
