///Class holds data needed to create visualizations for goal Data
class MetricsData {
  //short term data
  double numSTcompleted; // total completed short term goals
  double numShortGoals; //total short term goals
  double stCompletionPrcnt; //percent of completed short term goals
  //long term data
  double totalLTprogress; //total long term goal progress
  double totalDuration; //total long term goal duration
  double numLongGoals;
  double durationPrcnt; //percent of duration completed for long term goals
  //overall data
  double numOverallCmplt;
  double totalGoals;
  double overallCmpltPrcnt;
  double overallProgressPrcnt; // percent of progress of all goals

  DateTime? dataCollectionDate;
  String? dayOfWeek;

  ///initializes data
  MetricsData(
      {required this.numSTcompleted,
      required this.numShortGoals,
      required this.stCompletionPrcnt,
      required this.totalLTprogress,
      required this.totalDuration,
      required this.numLongGoals,
      required this.durationPrcnt,
      required this.numOverallCmplt,
      required this.totalGoals,
      required this.overallCmpltPrcnt,
      required this.overallProgressPrcnt});

  Map<String, dynamic> toJson() {
    return {
      'numSTcompleted': numSTcompleted,
      'numShortGoals': numShortGoals,
      'stCompletionPrcnt': stCompletionPrcnt,
      'totalLTprogress': totalLTprogress,
      'totalDuration': totalDuration,
      'numLongGoals': numLongGoals,
      'durationPrcnt': durationPrcnt,
      'numOverallCmplt': numOverallCmplt,
      'totalGoals': totalGoals,
      'overallCmpltPrcnt': overallCmpltPrcnt,
      'overallProgressPrcnt': overallProgressPrcnt,
    };
  }

  factory MetricsData.fromJson(dynamic json) {
    return MetricsData(
        durationPrcnt: json['durationPrcnt'] as double,
        numLongGoals: json['numLongGoals'] as double,
        numOverallCmplt: json['numOverallCmplt'] as double,
        numSTcompleted: json['numSTcompleted'] as double,
        numShortGoals: json['numShortGoals'] as double,
        overallCmpltPrcnt: json['overallCmpltPrcnt'] as double,
        overallProgressPrcnt: json['overallProgressPrcnt'] as double,
        stCompletionPrcnt: json['stCompletionPrcnt'] as double,
        totalDuration: json['totalDuration'] as double,
        totalGoals: json['totalGoals'] as double,
        totalLTprogress: json['totalLTprogress'] as double);
  }
}

///Class used to calculate and handle data received for the MetricsData class
class MetricsController {
  List goalList;

  MetricsController({required this.goalList});

  ///SHORT TERM GOAL DATA HANDLING
  //Method calculates the percent of short term goals completed
  List<double> shortPrcntCmplt() {
    double shortCmpltCnt = 0; //completed goal counter
    double numShortGoals = 0; //short term goal counter
    double completionPrcnt = 0;

    // for loop iterates through the goalList
    for (var i = 0; i < goalList.length; i++) {
      var currentGoal = goalList[i];
      print(currentGoal.title);
      print(currentGoal.isCompleted);
      //if statement targets each short term goal
      if (currentGoal.isLongTerm == false) {
        numShortGoals = numShortGoals + 1;

        //if statement targets each completed short term goal
        if (currentGoal.isCompleted == true) {
          shortCmpltCnt = shortCmpltCnt + 1;

        }
      }
    }
    //calculates percent of short term goals complete
    completionPrcnt = (shortCmpltCnt / numShortGoals) * 100;
    if (completionPrcnt.isNaN) {
      completionPrcnt = 0;
    }

    if (goalList.isEmpty) {
      shortCmpltCnt = 0.0;
      numShortGoals = 0.0;
      completionPrcnt = 0.0;
    }
    return [
      shortCmpltCnt,
      numShortGoals,
      completionPrcnt
    ]; //returns list of data
  }

  ///LONG TERM GOAL DATA HANDLING
  //Method calculates the percentage of duration completed for all Longterm goals
  List<double> prcntDuration() {
    double totalProgress = 0; //progress counter
    double totalDuration = 0; //duration counter
    double totalTime = 0; //progress counter
    double numLongGoals = 0;
    double durationPrcnt = 0;

    // for loop iterates through the goalList
    for (var i = 0; i < goalList.length; i++) {
      var currentGoal = goalList[i];
      //if statement targets each long term goal
      if (currentGoal.isLongTerm == true) {
        numLongGoals = numLongGoals + 1;
        //adds the getter stored value to the progress counter
        totalProgress = totalProgress + currentGoal.goalProgress;
        totalTime = totalTime + currentGoal.timeDedicated;
        //adds the getter stored value to the duration counter
        totalDuration = totalDuration + currentGoal.goalDuration;
      }
    }
    durationPrcnt =
        (totalProgress / numLongGoals) * 100; //calulcates percentage

    if (durationPrcnt.isNaN) {
      durationPrcnt = 0;
    }

    if (goalList.isEmpty) {
      totalProgress = 0;
      totalDuration = 0;
      numLongGoals = 0;
      durationPrcnt = 0;
    }

    return [
      totalTime,
      totalDuration,
      numLongGoals,
      durationPrcnt
    ]; //returns list of data
  }

  ///OVERALL DATA HANDLING
  //Method calculates the percent of all goals completed
  List<double> prcntOverallCmplt() {
    // for loop iterates through the goalList
    double totalGoals = 0;
    double overallCmpltCnt = 0;
    double overallCompltPrcnt = 0;

    for (var i = 0; i < goalList.length; i++) {
      var currentGoal = goalList[i];
      totalGoals = totalGoals + 1;
      //if statement targets each long term goal
      if (currentGoal.isLongTerm == true) {
        //if statement targets each completed long term goal
        if (currentGoal.isCompleted == true) {
          overallCmpltCnt = overallCmpltCnt + 1;
        }
      } else if (currentGoal.isLongTerm == false) {
        //else catches short term goals
        if (currentGoal.isCompleted == true) {
          overallCmpltCnt = overallCmpltCnt + 1;
        }
      }
    }
    overallCompltPrcnt = (overallCmpltCnt / totalGoals) * 100;

    if (goalList.isEmpty) {
      overallCmpltCnt = 0;
      totalGoals = 0;
      overallCompltPrcnt = 0;
    }

    if (overallCompltPrcnt.isNaN) {
      overallCompltPrcnt = 0;
    }
    return [overallCmpltCnt, totalGoals, overallCompltPrcnt];
  }

//Method calculates percentage of all goals completed using the prcntComplete and prcntDuration methods
  double prcntOverallProgress() {
    int goalCount = 0;
    double completedGoalPrcnt = 0;

    //averages the the values
    double overallPrcnt = 0;
    for (var goal in goalList) {
      goalCount += 1;
      if (goal.isCompleted) {
        completedGoalPrcnt += 1;
      } else {
        if (goal.isLongTerm == true) {
          completedGoalPrcnt += goal.goalProgress;
        }
      }
    }
    overallPrcnt = (completedGoalPrcnt / goalCount) * 100;

    if (overallPrcnt.isNaN) {
      return 0;
    }

    return overallPrcnt;
  }
}

MetricsData calcData(List sampleList) {
  final sampleController = MetricsController(goalList: sampleList);
  final sampleData = MetricsData(

      //Short term data
      numSTcompleted: sampleController
          .shortPrcntCmplt()
          .elementAt(0), //return idx[0] for prcntComplete func
      numShortGoals: sampleController
          .shortPrcntCmplt()
          .elementAt(1), //return idx[1] prcntComplete  func
      stCompletionPrcnt: sampleController
          .shortPrcntCmplt()
          .elementAt(2), //return idx[2] for prcntComplete func
      //Long term data
      totalLTprogress: sampleController
          .prcntDuration()
          .elementAt(0), //return idx[0] for  prcntDuration func
      totalDuration: sampleController
          .prcntDuration()
          .elementAt(1), //return idx[1] for prcntDuration func
      numLongGoals: sampleController
          .prcntDuration()
          .elementAt(2), //return idx[2] for prcntDuration func
      durationPrcnt: sampleController
          .prcntDuration()
          .elementAt(3), //return idx[3] for prcntDuration func
      //Overall Data
      numOverallCmplt: sampleController
          .prcntOverallCmplt()
          .elementAt(0), //return idx[0] for prcntOverallCmplt func
      totalGoals: sampleController
          .prcntOverallCmplt()
          .elementAt(1), //return idx[1] for prcntOverallCmplt func
      overallCmpltPrcnt: sampleController
          .prcntOverallCmplt()
          .elementAt(2), //return idx[2] for prcntOverallCmplt func
      overallProgressPrcnt: sampleController
          .prcntOverallProgress()); //return prcntOverallProgress func value

  return sampleData;
}
