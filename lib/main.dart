import 'package:chatty_ai/App/app.locator.dart';
import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Features/Chat/Views/chat_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  // Setup the Locator of Stacked to use its services
  await setupLocator();
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: ChatView(),
    );
  }
}
