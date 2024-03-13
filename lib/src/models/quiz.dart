

class Quiz {
  List<String> answers;
  int id, correctAnswer;
  String question;

  Quiz({
    required this.question,
    required this.id,
    required this.answers,
    required this.correctAnswer,
  });

  // final StreamController<int> _timerController = StreamController<int>();

  // Stream<int> get timerStream => _timerController.stream;

  // void startTimer() {
  //   timer = Timer.periodic(const Duration(seconds: 1), (_) {
  //     seconds--;

  //     _timerController.add(seconds);

  //     if (seconds == 0) {
  //       timer.cancel();
  //       // Add logic for when the timer expires (e.g., move to the next question)
  //     }
  //   });
  // }

  // void dispose() {
  //   _timerController.close();
  // }
}
