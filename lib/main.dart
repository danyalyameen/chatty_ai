import 'package:chatty_ai/App/app.locator.dart';
import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Features/Authentication/Splash/Views/splash_view.dart';
import 'package:chatty_ai/Firebase/firebase_options.dart';
import 'package:chatty_ai/Providers/theme_switcher_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Setup the Locator of Stacked to use its services
  await setupLocator();
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize Supabase
  Supabase.initialize(
    url: "https://yovihczflagxdqvasjii.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlvdmloY3pmbGFneGRxdmFzamlpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk2MjA5MzMsImV4cCI6MjA1NTE5NjkzM30.PKygwqnvq7W95uaecZKBNGk7nLEEqYCxtH7aCCm6n8w",
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeSwitcherProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      home: SplashView(),
      theme: Provider.of<ThemeSwitcherProvider>(context).theme,
    );
  }
}
