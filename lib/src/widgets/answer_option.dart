// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techverse_math/src/logic/controller/quiz_controller.dart';

class AnswerOptions extends StatelessWidget {
  String text;
  int index, quizId;
  Function() onPressed;

  AnswerOptions({
    Key? key,
    required this.text,
    required this.index,
    required this.quizId,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: Get.find<QuizController>(),
      builder: (controller) => InkWell(
          onTap: controller.checkQuizAnswered(quizId) ? null : onPressed,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(width: 3, color: controller.getColor(index))),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: '${index + 1}. \t',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: text,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  if (controller.checkQuizAnswered(quizId) &&
                      controller.selectedAnswer == index)
                    Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.getColor(index),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            shape: BoxShape.circle),
                        child: Icon(
                          controller.getIcon(index),
                          color: Colors.white,
                        ))
                ],
              ),
            ),
          )),
    );
  }
}
