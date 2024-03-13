import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:techverse_math/src/logic/cubit/quiz_cubit.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Quiz  ',
          style: const TextStyle(
              color: Color(0xFF37E9BB),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'question',
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
