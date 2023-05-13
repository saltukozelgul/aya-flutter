import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/community/pages/community_default_page/cubit/default_community_cubit.dart';
import 'package:aya_project/product/community/pages/community_default_page/service/default_community_service.dart';
import '../../../../../feature/components/default_tab_controller/default_tab_controller.dart';
import '../../../../../feature/components/default_tab_controller/tab.dart';
import '../states/default_community_states.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({
    super.key,
  });

  final EdgeInsets _paddingPage = const EdgeInsets.only(left: 16, right: 16);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DefaultCommunityCubit(DefaultCommunityServiceImpl(), context),
      child: _scaffoldBuilder(),
    );
  }

  BlocConsumer<DefaultCommunityCubit, DefaultCommunityStates> _scaffoldBuilder() {
    return BlocConsumer<DefaultCommunityCubit, DefaultCommunityStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: _paddingPage,
              child: Column(children: [
                _pageContent(state, context),
              ]),
            ),
          ),
          floatingActionButton: _floatingActionButton(context),
        );
      },
    );
  }

  Expanded _pageContent(DefaultCommunityStates state, BuildContext context) {
    return const Expanded(
      flex: 80,
      child: Text("CommunityScreen"),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<DefaultCommunityCubit>(context),
      child: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add, color: Colors.white, size: 36),
      ),
    );
  }

  Widget _loadingScreen(BuildContext context) {
    context.read<DefaultCommunityCubit>().getMyCommunities();
    return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
  }
}

class _Strings {
  String explore = 'Keşfet';
  String myCommunities = 'Topluluklarım';
  String searchLabel = 'Topluluk Ara';
}
