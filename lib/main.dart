import 'package:flutter/material.dart';
import 'package:traacka/initialize_singletons.dart';
import 'package:traacka/views/homepage/homepage.dart';
import 'package:traacka/views/widgets/components/colors/colors.dart';
import 'package:traacka/views/splash_screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

GlobalKey<ScaffoldMessengerState> scaff = GlobalKey<ScaffoldMessengerState>();

// Define a GlobalKey for the NavigatorState
GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaff,
        title: 'TraaKa',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appGreen),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
