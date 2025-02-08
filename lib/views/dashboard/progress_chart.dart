import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../controllers/progress_controller.dart';

class ProgressChart extends StatelessWidget {
  const ProgressChart({super.key});


  @override
  Widget build(BuildContext context) {
      final ProgressController controller = Get.find();

    return Obx(() => SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <CartesianSeries>[
            LineSeries<Map<String, dynamic>, String>(
              dataSource: [
                {'day': 'Mon', 'calories': 1200},
                {'day': 'Tue', 'calories': 1800},
                {
                  'day': 'Wed',
                  'calories': controller.currentProgress.value.caloriesBurned
                },
                
              ],
              xValueMapper: (Map<String, dynamic> data, _) => data['day'],
              yValueMapper: (Map<String, dynamic> data, _) => data['calories'],
            )
          ],
        ));
  }
}
