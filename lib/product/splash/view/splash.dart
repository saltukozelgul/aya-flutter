import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/core/constants/local_paths/local_paths.dart';
import 'package:aya_project/core/route/app_route.gr.dart';
import 'package:aya_project/product/splash/service/splash_repository.dart';

import '../cubit/splash_cubit.dart';
import '../states/splash_states.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(SplashRepositoryImpl()),
      child: _buildScaffold(context),
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary, // background color
      body: BlocConsumer<SplashCubit, SplashStates>(
        builder: (context, state) {
          if (state is InitialState) {
            print("initial state");
            context.router.pushAndPopUntil(const OnboardRouter(), predicate: (route) => false);
          }
          return _screen(context);
        },
        listener: (context, state) {
          print(state);
          context.router.pushAndPopUntil(const OnboardRouter(), predicate: (route) => false);
        },
      ),
    );
  }

  Center _screen(BuildContext context) => Center(
        child: Image.asset(
          LocalPaths().splashLogoLighPath,
          height: MediaQuery.of(context).size.height / 2.5,
        ),
      );
}
