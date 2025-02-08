class Progress {
  String id;
  DateTime date;
  int steps;
  double caloriesBurned;
  double goalCalories;

  Progress({
    required this.id,
    required this.date,
    this.steps = 0,
    this.caloriesBurned = 0.0,
    this.goalCalories = 2000.0,
  });

  Progress copyWith({
    String? id,
    DateTime? date,
    int? steps,
    double? caloriesBurned,
    double? goalCalories, 
  }) {
    return Progress(
      id: id ?? this.id,
      date: date ?? this.date,
      steps: steps ?? this.steps,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      goalCalories: goalCalories ?? this.goalCalories, 
    );
  }
}