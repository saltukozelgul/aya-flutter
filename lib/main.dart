import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //final $AppRouter _appRouter = $AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        //routerConfig: _appRouter.config(),
        );
  }
}
