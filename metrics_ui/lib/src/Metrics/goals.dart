class Goal {
  // Goal(this.title, this.dateCreated, [this.isCompleted=false]) : assert(isCompleted != null);
  //
  // final String title;
  // final DateTime dateCreated ;
  // final bool isCompleted;
  //
  // }
  /// The ID of the goal

  /// The title of the goal.
  String title;

  /// Whether the goal is completed.
  bool? isCompleted;

  /// The date the goal was created.
  DateTime dateCreated;

  /// The date the goal was completed.
  DateTime? dateCompleted;

  /// If the goal is a short term goal or a long term goal.
  final isLongTerm = false;

  Goal({
    required this.title,
    required bool this.isCompleted,
    DateTime? dateCreated,
    DateTime? dateCompleted,
  })  : dateCreated = dateCreated ?? DateTime.now(),
        dateCompleted = dateCompleted;

  String get goalTitle => title;

  /// Gets the status of the goal.
  //bool? get goalStatus => isCompleted;

  /// Gets the date the goal was created.
  DateTime get goalCreationDate => dateCreated;

  /// Gets the date the goal was completed.
  DateTime? get goalCompletionDate => dateCompleted;
}

class LongTermGoal extends Goal {
  /// The duration of the goal (hours).
  final double duration;

  /// The progress of the goal/how many hours have been spent on it.
  double progress;

  /// The time dedicated to the goal.
  double timeDedicated;

  LongTermGoal({
    required String title,
    required this.duration,
    required bool isCompleted,
    double? progress,
    double? timeDedicated,
    required DateTime dateCreated,
    DateTime? dateCompleted,
  })  : timeDedicated = timeDedicated ?? 0.0,
        progress = timeDedicated! / duration,
        super(
          title: title,
          isCompleted: isCompleted,
          dateCreated: dateCreated,
          dateCompleted: dateCompleted,
        );

  /// Gets the duration of the goal.
  double get goalDuration => duration;

  /// Gets the progress of the goal.
  double get goalProgress => progress;

  /// Gets the time dedicated to the goal.
  double get goalTimeDedicated => timeDedicated;

  @override
  bool get isLongTerm => true;
}
