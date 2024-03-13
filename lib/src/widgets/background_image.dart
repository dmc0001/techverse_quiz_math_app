import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

 

  @override
  Widget build(BuildContext context) {
   // double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: 550,
      decoration: const BoxDecoration(
        // You can add additional decoration properties if needed
      ),
      child: SvgPicture.asset(
        'lib/assets/icons/Vector.svg',
        fit: BoxFit.cover, // Adjust the fit property as needed
      ),
    );
  }
}
