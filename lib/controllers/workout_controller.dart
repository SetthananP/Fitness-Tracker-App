import 'package:get/get.dart';
import '../models/workout_model.dart';

class WorkoutController extends GetxController {
  var workouts = <Workout>[].obs;
  
  void addWorkout(Workout workout) {
    workouts.add(workout);
  }

  void editWorkout(String id, Workout newWorkout) {
    final index = workouts.indexWhere((w) => w.id == id);
    if (index != -1) {
      workouts[index] = newWorkout;
    }
  }
}