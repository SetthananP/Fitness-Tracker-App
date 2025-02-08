import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/progress_controller.dart';
import '../../controllers/settings_controller.dart';
import 'progress_chart.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgressController progressController =
        Get.find<ProgressController>();
    final SettingsController settingsController =
        Get.find<SettingsController>();

    return Scaffold(
      appBar: AppBar(title: Text('Fitness Dashboard')),
      body: Column(
        children: [
          ProgressChart(),
          SizedBox(height: 20),
          Obx(() => Text(
              'Steps: ${progressController.currentProgress.value.steps} / 5000')),
          SizedBox(height: 10),
          Obx(() => LinearProgressIndicator(
                value: progressController.currentProgress.value.steps / 5000,
              )),
          SizedBox(height: 20),
          Obx(() => Text(
              'Calories Burned: ${progressController.currentProgress.value.caloriesBurned} / ${settingsController.dailyGoal.value}')),
          SizedBox(height: 10),
          Obx(() => LinearProgressIndicator(
                value: progressController.currentProgress.value.caloriesBurned /
                    settingsController.dailyGoal.value,
              )),
          SizedBox(height: 20),
          Obx(() => ElevatedButton(
                onPressed:
                    (progressController.currentProgress.value.steps >= 5000 ||
                            progressController
                                    .currentProgress.value.caloriesBurned >=
                                settingsController.dailyGoal.value)
                        ? null
                        : progressController.simulateActivity,
                child: Text('Simulate 100 Steps'),
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/dashboard');
          } else if (index == 1) {
            Get.toNamed('/workouts');
          } else if (index == 2) {
            Get.toNamed('/settings');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Workouts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
