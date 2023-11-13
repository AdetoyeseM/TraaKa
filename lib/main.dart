import 'package:flutter/material.dart';
import 'package:traacka/views/components/colors/colors.dart';
import 'package:traacka/views/splash_screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TraaKa',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appGreen),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
