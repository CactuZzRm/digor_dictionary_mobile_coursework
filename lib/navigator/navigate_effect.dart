import 'package:flutter/material.dart';

class NavigateEffects {
  const NavigateEffects._();
  static PageRouteBuilder<dynamic> fadeTransitionToPage(Widget page) {
    const duration = Duration(milliseconds: 400);
    return PageRouteBuilder(
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    );
  }
}
