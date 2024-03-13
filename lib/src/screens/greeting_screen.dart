import 'package:flutter/material.dart';

import 'package:techverse_math/src/widgets/background_image.dart';
import 'package:techverse_math/src/widgets/glass_shape.dart';
import 'package:techverse_math/src/widgets/greeting_card.dart';




class GreetingScreen extends StatefulWidget {
  const GreetingScreen({Key? key}) : super(key: key);

  @override
  State<GreetingScreen> createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF002233),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  const BackgroundImage(),
                ],
              ),

              // Add your additional widgets to be displayed on top of the stack
              Positioned(
                top: 32,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const Text(
                      'Welcome to math',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Quiz game!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    GlassShape(
                      theWidth: 350,
                      theHeight: 500,
                      theChild: GreetingCard(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

