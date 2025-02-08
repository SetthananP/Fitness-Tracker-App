import 'package:get/get.dart';
import '../controllers/progress_controller.dart';
import '../controllers/settings_controller.dart';
import '../controllers/workout_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgressController());
    Get.lazyPut(() => SettingsController());
    Get.put(WorkoutController());
  }
}
