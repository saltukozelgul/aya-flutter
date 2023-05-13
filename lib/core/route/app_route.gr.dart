// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:auto_route/empty_router_widgets.dart' as _i8;
import 'package:flutter/material.dart' as _i14;

import '../../product/activity/pages/activity_default/views/activity_screen.dart'
    as _i11;
import '../../product/authentication/forgot_password/view/forgot_password.dart'
    as _i4;
import '../../product/authentication/login/view/login_screen.dart' as _i3;
import '../../product/authentication/signup/model/name_avatar_model.dart'
    as _i15;
import '../../product/authentication/signup/view/signup1_screen.dart' as _i5;
import '../../product/authentication/signup/view/signup2_screen.dart' as _i6;
import '../../product/community/pages/community_default_page/view/default_community_screen.dart'
    as _i10;
import '../../product/home/page_controller/page_controller.dart' as _i7;
import '../../product/home/pages/home_default/view/home_screen.dart' as _i9;
import '../../product/onboard/view/onboard_screen.dart' as _i2;
import '../../product/profile/pages/default_profile/view/profile_screen.dart'
    as _i12;
import '../../product/splash/view/splash.dart' as _i1;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    OnboardRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardScreen(),
      );
    },
    LoginRouter.name: (routeData) {
      final args = routeData.argsAs<LoginRouterArgs>(
          orElse: () => const LoginRouterArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
      );
    },
    ForgotPasswordRouter.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouterArgs>(
          orElse: () => const ForgotPasswordRouterArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ForgotPassword(key: args.key),
      );
    },
    SignupOneRouter.name: (routeData) {
      final args = routeData.argsAs<SignupOneRouterArgs>(
          orElse: () => const SignupOneRouterArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SignupScreenOne(key: args.key),
      );
    },
    SignupTwoRouter.name: (routeData) {
      final args = routeData.argsAs<SignupTwoRouterArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.SignupScreenTwo(
          key: args.key,
          model: args.model,
        ),
      );
    },
    HomeControllerRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HomePageController(),
      );
    },
    HomePagesRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.EmptyRouterPage(),
      );
    },
    CommunityPagesRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.EmptyRouterPage(),
      );
    },
    ActivityPagesRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.EmptyRouterPage(),
      );
    },
    ProfilePagesRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.EmptyRouterPage(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.HomeScreen(),
      );
    },
    CommunityScreenRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CommunityScreen(),
      );
    },
    ActivityScreenRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ActivityScreen(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ProfileScreen(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i13.RouteConfig(
          SplashRouter.name,
          path: '/splash',
        ),
        _i13.RouteConfig(
          OnboardRouter.name,
          path: '/onboard',
        ),
        _i13.RouteConfig(
          LoginRouter.name,
          path: '/login',
        ),
        _i13.RouteConfig(
          ForgotPasswordRouter.name,
          path: '/forgotPassword',
        ),
        _i13.RouteConfig(
          SignupOneRouter.name,
          path: '/signupOne',
        ),
        _i13.RouteConfig(
          SignupTwoRouter.name,
          path: '/signupTwo',
        ),
        _i13.RouteConfig(
          HomeControllerRouter.name,
          path: '/homeController',
          children: [
            _i13.RouteConfig(
              HomePagesRouter.name,
              path: 'home',
              parent: HomeControllerRouter.name,
              children: [
                _i13.RouteConfig(
                  HomeRouter.name,
                  path: '',
                  parent: HomePagesRouter.name,
                )
              ],
            ),
            _i13.RouteConfig(
              CommunityPagesRouter.name,
              path: 'community',
              parent: HomeControllerRouter.name,
              children: [
                _i13.RouteConfig(
                  CommunityScreenRouter.name,
                  path: '',
                  parent: CommunityPagesRouter.name,
                )
              ],
            ),
            _i13.RouteConfig(
              ActivityPagesRouter.name,
              path: 'activity',
              parent: HomeControllerRouter.name,
              usesPathAsKey: true,
              children: [
                _i13.RouteConfig(
                  ActivityScreenRouter.name,
                  path: '',
                  parent: ActivityPagesRouter.name,
                )
              ],
            ),
            _i13.RouteConfig(
              ProfilePagesRouter.name,
              path: 'profilePages',
              parent: HomeControllerRouter.name,
              children: [
                _i13.RouteConfig(
                  ProfileRouter.name,
                  path: '',
                  parent: ProfilePagesRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRouter extends _i13.PageRouteInfo<void> {
  const SplashRouter()
      : super(
          SplashRouter.name,
          path: '/splash',
        );

  static const String name = 'SplashRouter';
}

/// generated route for
/// [_i2.OnboardScreen]
class OnboardRouter extends _i13.PageRouteInfo<void> {
  const OnboardRouter()
      : super(
          OnboardRouter.name,
          path: '/onboard',
        );

  static const String name = 'OnboardRouter';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRouter extends _i13.PageRouteInfo<LoginRouterArgs> {
  LoginRouter({_i14.Key? key})
      : super(
          LoginRouter.name,
          path: '/login',
          args: LoginRouterArgs(key: key),
        );

  static const String name = 'LoginRouter';
}

class LoginRouterArgs {
  const LoginRouterArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'LoginRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ForgotPassword]
class ForgotPasswordRouter
    extends _i13.PageRouteInfo<ForgotPasswordRouterArgs> {
  ForgotPasswordRouter({_i14.Key? key})
      : super(
          ForgotPasswordRouter.name,
          path: '/forgotPassword',
          args: ForgotPasswordRouterArgs(key: key),
        );

  static const String name = 'ForgotPasswordRouter';
}

class ForgotPasswordRouterArgs {
  const ForgotPasswordRouterArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SignupScreenOne]
class SignupOneRouter extends _i13.PageRouteInfo<SignupOneRouterArgs> {
  SignupOneRouter({_i14.Key? key})
      : super(
          SignupOneRouter.name,
          path: '/signupOne',
          args: SignupOneRouterArgs(key: key),
        );

  static const String name = 'SignupOneRouter';
}

class SignupOneRouterArgs {
  const SignupOneRouterArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SignupOneRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SignupScreenTwo]
class SignupTwoRouter extends _i13.PageRouteInfo<SignupTwoRouterArgs> {
  SignupTwoRouter({
    _i14.Key? key,
    required _i15.NameAvatarModel model,
  }) : super(
          SignupTwoRouter.name,
          path: '/signupTwo',
          args: SignupTwoRouterArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'SignupTwoRouter';
}

class SignupTwoRouterArgs {
  const SignupTwoRouterArgs({
    this.key,
    required this.model,
  });

  final _i14.Key? key;

  final _i15.NameAvatarModel model;

  @override
  String toString() {
    return 'SignupTwoRouterArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i7.HomePageController]
class HomeControllerRouter extends _i13.PageRouteInfo<void> {
  const HomeControllerRouter({List<_i13.PageRouteInfo>? children})
      : super(
          HomeControllerRouter.name,
          path: '/homeController',
          initialChildren: children,
        );

  static const String name = 'HomeControllerRouter';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class HomePagesRouter extends _i13.PageRouteInfo<void> {
  const HomePagesRouter({List<_i13.PageRouteInfo>? children})
      : super(
          HomePagesRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomePagesRouter';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class CommunityPagesRouter extends _i13.PageRouteInfo<void> {
  const CommunityPagesRouter({List<_i13.PageRouteInfo>? children})
      : super(
          CommunityPagesRouter.name,
          path: 'community',
          initialChildren: children,
        );

  static const String name = 'CommunityPagesRouter';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class ActivityPagesRouter extends _i13.PageRouteInfo<void> {
  const ActivityPagesRouter({List<_i13.PageRouteInfo>? children})
      : super(
          ActivityPagesRouter.name,
          path: 'activity',
          initialChildren: children,
        );

  static const String name = 'ActivityPagesRouter';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class ProfilePagesRouter extends _i13.PageRouteInfo<void> {
  const ProfilePagesRouter({List<_i13.PageRouteInfo>? children})
      : super(
          ProfilePagesRouter.name,
          path: 'profilePages',
          initialChildren: children,
        );

  static const String name = 'ProfilePagesRouter';
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRouter extends _i13.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i10.CommunityScreen]
class CommunityScreenRouter extends _i13.PageRouteInfo<void> {
  const CommunityScreenRouter()
      : super(
          CommunityScreenRouter.name,
          path: '',
        );

  static const String name = 'CommunityScreenRouter';
}

/// generated route for
/// [_i11.ActivityScreen]
class ActivityScreenRouter extends _i13.PageRouteInfo<void> {
  const ActivityScreenRouter()
      : super(
          ActivityScreenRouter.name,
          path: '',
        );

  static const String name = 'ActivityScreenRouter';
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRouter extends _i13.PageRouteInfo<void> {
  const ProfileRouter()
      : super(
          ProfileRouter.name,
          path: '',
        );

  static const String name = 'ProfileRouter';
}
