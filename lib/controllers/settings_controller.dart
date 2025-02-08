import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/progress_controller.dart';

class SettingsController extends GetxController {
  var notificationEnabled = true.obs;
  var dailyGoal = 2000.obs;

  @override
  void onInit() {
    loadSettings();
    super.onInit();
  }

  void toggleNotification(bool value) {
    notificationEnabled.value = value;
  }

  void updateDailyGoal(double value) {
    dailyGoal.value = value.toInt();
  }

  Future<void> loadSettings() async {
    try {
      final pref = await SharedPreferences.getInstance();
      notificationEnabled.value = pref.getBool('notifications') ?? true;
      dailyGoal.value = pref.getInt('dailyGoal') ?? 2000;
    } catch (e) {
      print('Error loading settings: $e');
    }
  }

  Future<void> saveSettings() async {
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.setBool('notifications', notificationEnabled.value);
      await pref.setInt('dailyGoal', dailyGoal.value);

      final progressController = Get.find<ProgressController>();
      progressController.currentProgress.value.goalCalories =
          dailyGoal.value.toDouble();
      progressController.currentProgress.refresh();

      Get.snackbar('Success', 'Settings saved!');
    } catch (e) {
      print('Error saving settings: $e');
    }
  }
}
