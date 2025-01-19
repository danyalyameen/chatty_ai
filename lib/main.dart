import 'package:chatty_ai/App/app.locator.dart';
import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Features/Authentication/Log%20in/Views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      home: LoginView(),
    );
  }
}
