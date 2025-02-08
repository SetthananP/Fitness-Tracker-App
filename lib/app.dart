import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/initial_bindings.dart';
import 'views/dashboard/dashboard_view.dart';
import 'views/settings/settings_view.dart';
import 'views/workout/workout_list_view.dart';

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      home: DashboardView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      
      // Configure app routes using GetX
      getPages: [
        GetPage(name: '/dashboard', page: () => DashboardView()),
        GetPage(name: '/workouts', page: () => WorkoutListView()),
        GetPage(name: '/settings', page: () => SettingsView()),
      ],
    );
  }
}
