import 'package:flutter/material.dart'; 
import 'package:traacka/main.dart';

navigateToPage(Widget page) {
  Navigator.push(
    navigatorKey!.currentContext!,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start the page offscreen to the right
        const end = Offset.zero; // End at the center of the screen

        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}

popView(BuildContext? context) {
  Navigator.pop(context!);
}

navigateReplaceToPage(Widget page) {
  Navigator.pushReplacement(
    navigatorKey!.currentContext!,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start the page offscreen to the right
        const end = Offset.zero; // End at the center of the screen

        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
