import 'package:get/get.dart';
import '../logic/controller/quiz_controller.dart';

class BindingApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
