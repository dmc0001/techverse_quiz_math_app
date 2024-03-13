import 'package:flutter/material.dart';
import 'package:techverse_math/src/widgets/background_image.dart';
import 'package:techverse_math/src/widgets/congrats_card.dart';
import 'package:techverse_math/src/widgets/glass_shape.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

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
              const Positioned(
                top: 32,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    SizedBox(height: 64,),
                    GlassShape(
                      theWidth: 350,
                      theHeight: 500,
                      theChild: CongratsCard(),
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
