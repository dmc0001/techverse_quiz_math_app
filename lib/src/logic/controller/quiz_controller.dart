import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techverse_math/src/models/quiz.dart';
import 'package:techverse_math/src/routes/constant_routes.dart';

class QuizController extends GetxController {
  //getters
  List<Quiz> get quizzes => _quizzes;
  bool get isPressed => _isPressed;
  double get quizIndex => _quizIndex;
  int get lenQuizzes => _quizzes.length;
  int? get selectedAnswer => _selectedAnswer;
  int get score => _score;
  RxInt get seconds => _seconds;

  //logic
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  double get scoreResult {
    return score * 100 / _quizzes.length;
  }

  void checkAnswer(Quiz quiz, int selectedAnswer) {
    _isPressed = true;
    _selectedAnswer = selectedAnswer;
    _correctAnswer = quiz.correctAnswer;
    if (_correctAnswer == _selectedAnswer) {
      _score++;
    }
    stopTimer();
    _answeredQuiz.update(quiz.id, (value) => true);
    Future.delayed(Durations.long2).then((value) => nextQuiz());
    update();
  }

  bool checkQuizAnswered(int quizId) {
    return _answeredQuiz.entries
        .firstWhere((element) => element.key == quizId)
        .value;
  }

  nextQuiz() {
    if (_timer != null || _timer!.isActive) {
      stopTimer();
    }
    if (pageController.page == _quizzes.length - 1) {
      Get.offAndToNamed(END_SCREEN);
    } else {
      _isPressed = false;
      pageController.nextPage(duration: Durations.long2, curve: Curves.linear);
      startTimer();
    }
    _quizIndex = pageController.page! + 2;
    update();
  }

  void startAgain() {
    _correctAnswer = null;
    _score = 0;
    _selectedAnswer = null;
    resetAnswer();
    Get.offAllNamed(GREETING_SCREEN);
  }

  void stopTimer() => _timer!.cancel();
  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds.value > 0) {
        _seconds.value--;
      } else {
        stopTimer();
        nextQuiz();
      }
    });
  }

  resetTimer() => _seconds.value = maxSec;

  void resetAnswer() {
    for (var element in _quizzes) {
      _answeredQuiz.addAll({element.id: false});
    }
    update();
  }

 Color getColor(int answeredIndex) {
  if (_isPressed) {
    if (answeredIndex == _correctAnswer) {
      return Colors.green;
    } else if (answeredIndex == _selectedAnswer &&
        _correctAnswer != _selectedAnswer) {
      return Colors.red;
    }
  }
  return Colors.white;
}


  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectedAnswer &&
          _correctAnswer != _selectedAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  // Private variables
  String fullName = '';
  int? _correctAnswer;
  final Map<int, bool> _answeredQuiz = {};
  Timer? _timer;
  static const int maxSec = 15;
  late PageController pageController;

  bool _isPressed = false;
  double _quizIndex = 1;
  int? _selectedAnswer;
  int _score = 0;
  final RxInt _seconds = 30.obs;

  final List<Quiz> _quizzes = [
    Quiz(
      question: "Find the limit as x approaches 0 of (sin(x)/x).",
      id: 1,
      answers: ["0", "1", "undefined", "infinity"],
      correctAnswer: 1,
    ),
    Quiz(
      question: "Evaluate the integral ∫(2x + 5)dx from 1 to 3.",
      id: 2,
      answers: ["12", "16", "18", "24"],
      correctAnswer: 2,
    ),
    Quiz(
      question: "Solve the differential equation dy/dx = 2x, where y(0) = 1.",
      id: 3,
      answers: ["e^(x^2)", "e^(x^2/2)", "e^(x^2-1)", "e^(x^2+1)"],
      correctAnswer: 1,
    ),
    Quiz(
      question: "What is the eigenvalue of the matrix [[3, 1], [2, 4]]?",
      id: 4,
      answers: ["1", "2", "3", "4"],
      correctAnswer: 3,
    ),
    Quiz(
      question: "Simplify the expression: (2i - 3)(4i + 5).",
      id: 5,
      answers: ["-23 - 2i", "-23 + 2i", "23 - 2i", "23 + 2i"],
      correctAnswer: 1,
    ),
    Quiz(
      question: "Find the inverse of the function f(x) = 3x + 2.",
      id: 6,
      answers: ["(x - 2)/3", "(x + 2)/3", "(x - 2)/3", "(x + 2)/3"],
      correctAnswer: 0,
    ),
    Quiz(
      question: "What is the Taylor series expansion of e^x?",
      id: 7,
      answers: [
        "1 + x + x^2/2 + x^3/6 + ...",
        "1 - x + x^2/2 - x^3/6 + ...",
        "1 + x - x^2/2 + x^3/6 + ...",
        "1 - x - x^2/2 - x^3/6 + ..."
      ],
      correctAnswer: 0,
    ),
    Quiz(
      question:
          "Evaluate the double integral ∬(x + y) dA over the region R, where R is the triangle with vertices (0, 0), (1, 0), and (0, 2).",
      id: 8,
      answers: ["1/3", "2/3", "3/2", "5/2"],
      correctAnswer: 2,
    ),
    Quiz(
      question: "Determine the convergence of the series Σ(n^2 / (2^n)).",
      id: 9,
      answers: [
        "Convergent",
        "Divergent",
        "Conditionally convergent",
        "Alternating series"
      ],
      correctAnswer: 0,
    ),
    Quiz(
      question:
          "Find the solution to the system of linear equations: 2x - y = 3, 3x + 2y = 8.",
      id: 10,
      answers: [
        "x = 2, y = -1",
        "x = -1, y = 2",
        "x = 1, y = 1",
        "x = -2, y = 3"
      ],
      correctAnswer: 0,
    ),
    Quiz(
      question:
          "What is the Laplace transform of the function f(t) = e^(3t) * sin(2t)?",
      id: 11,
      answers: [
        "s - 3 / (s - 3)^2 + 4",
        "s - 3 / (s - 3)^2 - 4",
        "s + 3 / (s + 3)^2 - 4",
        "s + 3 / (s + 3)^2 + 4"
      ],
      correctAnswer: 0,
    ),
    Quiz(
      question:
          "Evaluate the line integral ∮C (x^2 + y^2) ds, where C is the circle x^2 + y^2 = 4.",
      id: 12,
      answers: ["4π", "8π", "12π", "16π"],
      correctAnswer: 0,
    ),
    Quiz(
      question:
          "What is the probability of rolling a sum of 7 with two six-sided dice?",
      id: 13,
      answers: ["1/6", "1/8", "1/12", "1/36"],
      correctAnswer: 0,
    ),
    Quiz(
      question: "Solve the differential equation y'' - 4y' + 4y = 0.",
      id: 14,
      answers: ["e^(2x)", "e^(4x)", "xe^(2x)", "x^2e^(2x)"],
      correctAnswer: 2,
    ),
    Quiz(
      question:
          "Evaluate the triple integral ∭(x + y + z) dV over the region E, where E is the cube with vertices (0, 0, 0), (1, 0, 0), (0, 1, 0), (0, 0, 1).",
      id: 15,
      answers: ["1/4", "1/2", "3/4", "1"],
      correctAnswer: 3,
    ),
    Quiz(
      question: "Find the Maclaurin series expansion of ln(1 + x).",
      id: 16,
      answers: [
        "x - x^2/2 + x^3/3 - x^4/4 + ...",
        "-x + x^2/2 - x^3/3 + x^4/4 + ...",
        "x + x^2/2 + x^3/3 + x^4/4 + ...",
        "-x - x^2/2 - x^3/3 - x^4/4 + ..."
      ],
      correctAnswer: 0,
    ),
    Quiz(
      question: "If A is a 3x3 matrix with det(A) = 5, what is det(2A)?",
      id: 17,
      answers: ["5", "10", "15", "20"],
      correctAnswer: 3,
    ),
    Quiz(
      question:
          "Solve the system of linear differential equations: dx/dt = 2x + y, dy/dt = x - 2y.",
      id: 18,
      answers: [
        "x(t) = e^t, y(t) = e^t",
        "x(t) = e^t, y(t) = -e^t",
        "x(t) = -e^t, y(t) = e^t",
        "x(t) = -e^t, y(t) = -e^t"
      ],
      correctAnswer: 1,
    ),
    Quiz(
      question:
          "What is the area enclosed by the curve y = x^2 - 4x + 4 and the x-axis?",
      id: 19,
      answers: ["2", "4", "8", "16"],
      correctAnswer: 2,
    ),
    Quiz(
      question:
          "Determine the convergence of the series Σ((-1)^n * n/(n + 1)).",
      id: 20,
      answers: [
        "Convergent",
        "Divergent",
        "Conditionally convergent",
        "Alternating series"
      ],
      correctAnswer: 0,
    ),
    // Add more university-level math quizzes as needed
  ];
}
