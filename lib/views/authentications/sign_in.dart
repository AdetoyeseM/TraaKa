import 'package:flutter/material.dart';
import 'package:traacka/view_models/auth/googleauth_request.dart';
import 'package:traacka/views/components/colors/colors.dart';
import 'package:traacka/views/widgets/app_icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign IN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.appBlack,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              "Sign in with Google to proceed",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: AppColors.textBlack,
                  fontSize: 12),
            ),
            const Spacer(),
            Center(
                child: ElevatedButton.icon(
                    onPressed: () async {
                      await Auth().signInWithGoogle();
                    },
                    icon: const AppImage(
                      imageName: "google.png",
                      size: 48,
                    ),
                    label: const Text("Sign In with Google "))),
            const Spacer(),
          ],
        ),
      ),
    ));
  }
}
