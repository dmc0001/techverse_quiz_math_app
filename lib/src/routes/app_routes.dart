import 'package:flutter/material.dart';
import 'package:techverse_math/src/screens/end_screen.dart';
import 'package:techverse_math/src/screens/greeting_screen.dart';
import 'package:techverse_math/src/screens/quiz_screen.dart';

import 'constant_routes.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GREETING_SCREEN:
        return MaterialPageRoute(builder: (_) => const GreetingScreen());
      case QUIZ_SCREEN:
        return MaterialPageRoute(builder: (_) => const QuizScreen());
      case END_SCREEN:
        return MaterialPageRoute(builder: (_) => const EndScreen());
    }
    return null;
  }
}
