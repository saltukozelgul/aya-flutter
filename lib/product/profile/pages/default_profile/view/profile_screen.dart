import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/profile/pages/default_profile/states/profile_states.dart';

import '../cubit/profile_cubit.dart';
import '../service/profile_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileServiceImpl()),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: _pageContent(state, context),
            floatingActionButton: _floatingActionButton(context),
          );
        },
        listener: (context, state) {
          if (state is LogOutState) {
            //! for android close app not recommend for ios
            SystemNavigator.pop();
          }
        },
      ),
    );
  }

  //** Main Contents */

  Expanded _pageContent(ProfileStates state, BuildContext context) {
    return const Expanded(
      flex: 60,
      child: Text("Profile Screen"),
    );
  }

  //** Global Widgets for in every condition */

  Padding _floatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 0, bottom: MediaQuery.of(context).size.height - 140),
      child: SizedBox(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          mini: true,
          backgroundColor: Theme.of(context).cardColor,
          onPressed: () => {},
          child: Icon(Icons.more_vert, color: Theme.of(context).primaryColor, size: 28),
        ),
      ),
    );
  }
}

//** Helper classes for this page */

class _Strings {}

class _Styles {}
