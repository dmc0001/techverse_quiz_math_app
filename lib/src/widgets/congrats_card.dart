import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/controller/quiz_controller.dart';


class CongratsCard extends StatelessWidget {
  const CongratsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        init: Get.find<QuizController>(),
        builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Congrats ${controller.fullName}\nYour final Score is',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF37E9BB),
                  ),
                  child:  Center(
                      child: Text(
                      '${controller.scoreResult.round()} /100',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                ElevatedButton(
                  onPressed: () => controller.startAgain(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF002233)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Play Again!',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ));
  }
}
