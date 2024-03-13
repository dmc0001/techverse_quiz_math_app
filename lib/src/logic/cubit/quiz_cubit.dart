//import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:techverse_math/src/models/database/quizzes.dart';

import '../../../main.dart';
import '../../models/quiz.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  //static const maxSeconds = 5;
  int quizIndex = 0;
  late Quiz quiz;
  //late Timer timer;
  //int seconds = maxSeconds;

  // void loadQuiz() {
  //   if (quizIndex < quizzes.length) {
  //     quiz = quizzes[quizIndex];
  //     logger.d('here is the load fun ${quiz.seconds}');
  //     emit(QuizLoaded(quiz: quiz));

  //     // Start the timer when a new quiz is loaded
  //     // startTimer();

  //     quizIndex++;
  //   } else {
  //     emit(const QuizCompleted());
  //   }
  // }

  // Add this method to cancel the timer when it's no longer needed
}
