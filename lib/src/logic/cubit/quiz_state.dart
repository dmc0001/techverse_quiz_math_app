part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {
  const QuizState();
}

class QuizInitial extends QuizState {
  const QuizInitial();
}

class QuizLoaded extends QuizState {
  final Quiz quiz;
  const QuizLoaded({required this.quiz});
}

class QuizCompleted extends QuizState {
  const QuizCompleted();
}


