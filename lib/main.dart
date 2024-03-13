import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:techverse_math/src/routes/app_routes.dart';
import 'package:techverse_math/src/routes/constant_routes.dart';
import 'package:techverse_math/src/screens/greeting_screen.dart';
import 'package:techverse_math/src/screens/quiz_screen.dart';

import 'src/screens/end_screen.dart';
import 'src/utils/bindings_app.dart';

Logger logger = Logger(printer: PrettyPrinter());
void main() {
  runApp(TechVerseMathApp(
    appRoutes: AppRoutes(),
  ));
}

class TechVerseMathApp extends StatelessWidget {
  const TechVerseMathApp({super.key, required this.appRoutes});

  final AppRoutes appRoutes;

  // This widget is the root of your application.
 @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingApp(),
      title: 'Flutter Quiz App',
      home:  const GreetingScreen(),
      theme: ThemeData(
       fontFamily: 'Poppins', // Use Poppins font for the entire app
      ),
      getPages: [
         GetPage(name:GREETING_SCREEN, page: () => const GreetingScreen()),
         GetPage(name: QUIZ_SCREEN, page: () =>  const QuizScreen()),
         GetPage(name: END_SCREEN, page: () =>  const EndScreen()),
      ],
    );
  }
}
