import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/workout_controller.dart';
import 'add_edit_workout_view.dart';

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkoutController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Routines'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddEditWorkoutView()),
        child: Icon(Icons.add),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.workouts.length,
            itemBuilder: (context, index) {
              final workout = controller.workouts[index];
              return ListTile(
                title: Text(workout.name),
                subtitle: Text('${workout.calories} kcal'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () =>
                      Get.to(() => AddEditWorkoutView(workout: workout)),
                ),
              );
            },
          )),
    );
  }
}
