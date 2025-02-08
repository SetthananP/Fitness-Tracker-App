import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              controller.saveSettings();
              Get.snackbar('Success', 'Settings saved!', duration: 2.seconds);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Slider(
                  min: 1000,
                  max: 5000,
                  divisions: 4,
                  label: '${controller.dailyGoal.value} kcal',
                  value: controller.dailyGoal.value.toDouble(),
                  onChanged: controller.updateDailyGoal,
                )),
            Text('Daily Calorie Goal'),
          ],
        ),
      ),
    );
  }
}
