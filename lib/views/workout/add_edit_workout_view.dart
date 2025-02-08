import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/workout_controller.dart';
import '../../models/workout_model.dart';

class AddEditWorkoutView extends StatelessWidget {
  final WorkoutController _controller = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final Workout? workout;

  AddEditWorkoutView({super.key, this.workout}) {
    if (workout != null) {
      _nameController.text = workout!.name;
      _caloriesController.text = workout!.calories.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout == null ? 'Add Workout' : 'Edit Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Workout Name'),
            ),
            TextField(
              controller: _caloriesController,
              decoration: InputDecoration(labelText: 'Calories Burned'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newWorkout = Workout(
                  id: workout?.id ?? DateTime.now().toString(),
                  name: _nameController.text,
                  calories: int.parse(_caloriesController.text),
                  duration: Duration(minutes: 30),
                );

                workout == null
                    ? _controller.addWorkout(newWorkout)
                    : _controller.editWorkout(workout!.id, newWorkout);

                Get.back();
              },
              child: Text('Save Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
