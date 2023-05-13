import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aya_project/core/route/app_route.gr.dart';
import 'package:aya_project/product/authentication/login/model/theme_model.dart';
import 'package:provider/provider.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp.router(
            title: 'AYA',
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            theme: themeNotifier.isDark ? DarkTheme().darkTheme : LightTheme().lightTheme,
          );
        },
      ),
    );
  }
}
