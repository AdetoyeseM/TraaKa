import 'package:flutter/material.dart';
import 'package:traacka/views/authentications/sign_in.dart';
import 'package:traacka/views/widgets/components/colors/colors.dart';
import 'package:traacka/views/widgets/app_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = CurvedAnimation(
        parent: _animationController!, curve: Curves.easeInExpo);
    _animationController!.forward();
    Future.delayed(
        const Duration(seconds: 3),
        () async => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()))
            });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appGreen,
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(52.0),
        child: Center(
          child: FadeTransition(
            opacity: _animation!,
            child: const AppImage(
              imageName: "eden.svg",
            ),
          ),
        ),
      ),
    );
  }
}
