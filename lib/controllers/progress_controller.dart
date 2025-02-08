import 'package:get/get.dart';
import '../../models/progress_model.dart' as my_models;

class ProgressController extends GetxController {
  var currentProgress = my_models.Progress(
    id: 'daily',
    date: DateTime.now(),
    steps: 0,
    caloriesBurned: 0,
  ).obs;

  final int maxSteps = 10000;
  final double maxCalories = 2000.0; 

  void updateSteps(int newSteps) {
    currentProgress.value = currentProgress.value.copyWith(
      steps: (newSteps <= maxSteps) ? newSteps : maxSteps,
    );
  }

  void addCalories(double calories) {
    double newCalories = currentProgress.value.caloriesBurned + calories;
    currentProgress.value = currentProgress.value.copyWith(
      caloriesBurned: (newCalories <= maxCalories) ? newCalories : maxCalories,
    );
  }

  void simulateActivity() {
    updateSteps(currentProgress.value.steps + 100);
    addCalories(50);
  }
}
