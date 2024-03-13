import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techverse_math/src/models/quiz.dart';
import 'package:techverse_math/src/widgets/answer_option.dart';

import '../logic/controller/quiz_controller.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.quiz});
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quiz.question,
              style: const TextStyle(
              color: Color(0xFF37E9BB),
              fontSize: 18,
              fontWeight: FontWeight.bold)
          ),
          //const SizedBox(height: 15),
          const Spacer(
            flex: 1,
          ),
          ...List.generate(
              quiz.answers.length,
              (index) => Column(
                    children: [
                      AnswerOptions(
                          quizId: quiz.id,
                          text: quiz.answers[index],
                          index: index,
                          onPressed: () => Get.find<QuizController>()
                              .checkAnswer(quiz, index)),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  )),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
