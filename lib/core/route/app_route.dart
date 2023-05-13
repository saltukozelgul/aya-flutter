import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:aya_project/product/authentication/forgot_password/view/forgot_password.dart';
import 'package:aya_project/product/authentication/login/view/login_screen.dart';
import 'package:aya_project/product/authentication/signup/view/signup1_screen.dart';
import 'package:aya_project/product/authentication/signup/view/signup2_screen.dart';
import 'package:aya_project/product/onboard/view/onboard_screen.dart';

import '../../product/activity/pages/activity_default/views/activity_screen.dart';

import '../../product/community/pages/community_default_page/view/default_community_screen.dart';
import '../../product/home/page_controller/page_controller.dart';
import '../../product/home/pages/home_default/view/home_screen.dart';
import '../../product/profile/pages/default_profile/view/profile_screen.dart';
import '../../product/splash/view/splash.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: SplashScreen, name: 'SplashRouter', path: '/splash', initial: true),
    AutoRoute(page: OnboardScreen, name: 'OnboardRouter', path: '/onboard'),
    AutoRoute(page: LoginScreen, name: 'LoginRouter', path: '/login'),
    AutoRoute(page: ForgotPassword, name: 'ForgotPasswordRouter', path: '/forgotPassword'),
    AutoRoute(page: SignupScreenOne, name: 'SignupOneRouter', path: '/signupOne'),
    AutoRoute(page: SignupScreenTwo, name: 'SignupTwoRouter', path: '/signupTwo'),
    AutoRoute(
      page: HomePageController,
      name: 'HomeControllerRouter',
      path: '/homeController',
      children: <AutoRoute>[
        AutoRoute(
          page: EmptyRouterPage,
          name: 'HomePagesRouter',
          path: 'home',
          children: <AutoRoute>[
            AutoRoute(page: HomeScreen, name: 'HomeRouter', path: '', initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'CommunityPagesRouter',
          path: 'community',
          children: <AutoRoute>[
            AutoRoute(page: CommunityScreen, name: 'CommunityScreenRouter', path: '', initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'ActivityPagesRouter',
          path: 'activity',
          usesPathAsKey: true,
          children: <AutoRoute>[
            AutoRoute(page: ActivityScreen, name: 'ActivityScreenRouter', path: '', initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'ProfilePagesRouter',
          path: 'profilePages',
          children: <AutoRoute>[
            AutoRoute(page: ProfileScreen, name: 'ProfileRouter', path: '', initial: true),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
