import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/activity/pages/activity_default/service/activity_service.dart';
import '../../../../../feature/components/default_tab_controller/default_tab_controller.dart';
import '../../../../../feature/components/default_tab_controller/tab.dart';
import '../../../../home/pages/home_default/cubit/home_cubit.dart';
import '../cubit/activity_cubit.dart';
import '../states/activity_states.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityCubit(ActivityRepositoryImpl()),
      child: _buildScaffold(context),
    );
  }

  BlocConsumer _buildScaffold(BuildContext context) {
    return BlocConsumer<ActivityCubit, ActivityStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(flex: 10, child: _topNavigationBar(context)),
                const Expanded(
                  flex: 90,
                  child: Text("ActivityScreen"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _loadingScreen(BuildContext context, ActivityStates state) {
    // get logs
    if (state is InitialState) {
      context.read<ActivityCubit>().getLogs();
    }

    return Center(
        child: CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    ));
  }

  Widget _topNavigationBar(BuildContext context) {
    return CustomTabController(length: HomeScreenTabs.values.length, tabs: _tabs(), onTap: context.read<ActivityCubit>().changePage);
  }

  List<Widget> _tabs() {
    return [CustomTabTexts(title: _Strings().you, isLast: false), CustomTabTexts(title: _Strings().friends, isLast: true)];
  }
}

class _Strings {
  String friends = 'Arkadaşlar';
  String you = 'Sana Özel';
}
