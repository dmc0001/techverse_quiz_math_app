import 'dart:ui';
import 'package:flutter/material.dart';

@immutable
class GlassShape extends StatelessWidget {
  final double theWidth;
  final double theHeight;
  final Widget theChild;

  const GlassShape({
    Key? key,
    required this.theWidth,
    required this.theHeight,
    required this.theChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4.0,
                sigmaY: 4.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.13),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.5)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: theChild,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
