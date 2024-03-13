import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techverse_math/src/widgets/background_image.dart';
import 'package:techverse_math/src/widgets/glass_shape.dart';
import 'package:techverse_math/src/widgets/question_card.dart';
import 'package:techverse_math/src/widgets/quiz_card.dart';
import '../logic/controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF002233),
        body: Stack(
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
              child: GetBuilder<QuizController>(
                init: Get.find<QuizController>(),
                builder: (controller) => Column(
                  children: [
                    Text(
                      'Score ${controller.score}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildTimerDisplay(),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 450,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => GlassShape(
                            theWidth: 350,
                            theHeight: 550,
                            theChild: QuestionCard(
                              quiz: controller.quizzes[index],
                            ),
                          ),
                          controller: controller.pageController,
                          itemCount: controller.quizzes.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTimerDisplay() {
  final controller = Get.find<QuizController>();
  return Obx(
    () => Column(
      children: [
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              // Adjust the max value as needed
              value: 1 - (controller.seconds.value / 15),
              backgroundColor: Colors.grey,
              color: Colors.purple,
              strokeWidth: 6,
            ),
            Center(
              child: Text(
                '${controller.seconds.value}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
