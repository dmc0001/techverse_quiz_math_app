import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:techverse_math/src/routes/constant_routes.dart';
import '../../main.dart';
import 'package:get/get.dart';
import 'package:techverse_math/src/logic/controller/quiz_controller.dart';

class GreetingCard extends StatelessWidget {
  GreetingCard({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void _submit(context) {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    logger.d(Get.find<QuizController>().fullName);
    Get.offAndToNamed(QUIZ_SCREEN);
    Get.find<QuizController>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 75,
            height: 75,
            child: Lottie.asset(
                'lib/assets/animations/Animation - 1710012806721.json'),
          ),
          const Text(
            'Let\'s Play!',
            style: TextStyle(
                fontSize: 48, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'What\'s your name?',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 58.0),
                child: Form(
                  key: formKey,
                  child: GetBuilder(
                    init: Get.find<QuizController>(),
                    builder: (controller) => TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.all(8.0),
                        fillColor: Colors.white.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: 'Full name...',
                      ),
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Name should not be empty';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? val) {
                        controller.fullName = val!.trim().toUpperCase();
                      },
                      onFieldSubmitted: (_) => _submit(context),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _submit(context);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF002233)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: const Text(
              'Start Now!',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
