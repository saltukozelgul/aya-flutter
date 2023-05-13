import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/feature/components/default_tab_controller/default_tab_controller.dart';
import '../../../../../core/constants/other/colors.dart';
import '../../../../../feature/components/default_tab_controller/tab.dart';
import '../cubit/home_cubit.dart';
import '../service/home_repository.dart';
import '../states/home_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepositoryImpl()),
      child: _buildScaffold(context),
    );
  }

  BlocConsumer _buildScaffold(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                const Text("HomeScreen"),
              ],
            ),
          ),
          floatingActionButton: _floatingActionButton(context),
        );
      },
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'homeScreen',
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => {},
      child: const Icon(Icons.search, color: colorWhite),
    );
  }

  Widget _topNavigationBar(BuildContext context) {
    return CustomTabController(length: HomeScreenTabs.values.length, tabs: [], onTap: () => {});
  }

  Center _loadingScreen(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: colorPrimary));
  }
}

class _Strings {}
