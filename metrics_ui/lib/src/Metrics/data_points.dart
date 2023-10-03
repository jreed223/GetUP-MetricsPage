import 'package:flutter/foundation.dart';

import 'metrics_controller.dart';

//import 'goal_organizer.dart';
import 'goals.dart';
import 'metrics_queue.dart';

// final List _sampleGoalsM = [
//   LongTermGoal(
//     title: 'Learn Flutter',
//     duration: 20,
//   ),
//   Goal(title: 'ijbib'),
//   LongTermGoal(title: 'Read', duration: 5),
//   Goal(title: 'Go to the gym'),
//   LongTermGoal(title: 'Learn Dart', duration: 10),
//   Goal(title: 'Go to the dentist'),
//   LongTermGoal(title: 'Learn Python', duration: 15),
// ];
//List<MetricsData> weeklyMetrics = METRICS_QUEUE.getMetricsData();

/// this class represents one bar in a bar graph
class DataPoints {
  final String? day; //weekday
  final double val;
  final double? val2; //overall percentage

  DataPoints({this.day, required this.val, this.val2});
}

List<DataPoints> setLineData(List<MetricsData> weeklyMetrics) {
  DataPoints lineData1 = DataPoints(
      day: weeklyMetrics[0].dayOfWeek,
      val: weeklyMetrics[0].overallProgressPrcnt,
      val2: ((weeklyMetrics[0].durationPrcnt * weeklyMetrics[0].numLongGoals) +
              (weeklyMetrics[0].numShortGoals * 100)) /
          weeklyMetrics[0].totalGoals);
  DataPoints lineData2 = DataPoints(
      day: weeklyMetrics[1].dayOfWeek,
      val: weeklyMetrics[1].overallProgressPrcnt,
      val2: ((weeklyMetrics[1].durationPrcnt * weeklyMetrics[6].numLongGoals) +
              (weeklyMetrics[1].numShortGoals * 100)) /
          weeklyMetrics[1].totalGoals);
  DataPoints lineData3 = DataPoints(
      day: weeklyMetrics[2].dayOfWeek,
      val: weeklyMetrics[2].overallProgressPrcnt,
      val2: ((weeklyMetrics[2].durationPrcnt * weeklyMetrics[2].numLongGoals) +
              (weeklyMetrics[2].numShortGoals * 100)) /
          weeklyMetrics[2].totalGoals);
  DataPoints lineData4 = DataPoints(
      day: weeklyMetrics[3].dayOfWeek,
      val: weeklyMetrics[3].overallProgressPrcnt,
      val2: ((weeklyMetrics[3].durationPrcnt * weeklyMetrics[3].numLongGoals) +
              (weeklyMetrics[3].numShortGoals * 100)) /
          weeklyMetrics[3].totalGoals);
  DataPoints lineData5 = DataPoints(
      day: weeklyMetrics[4].dayOfWeek,
      val: weeklyMetrics[4].overallProgressPrcnt,
      val2: ((weeklyMetrics[4].durationPrcnt * weeklyMetrics[4].numLongGoals) +
              (weeklyMetrics[4].numShortGoals * 100)) /
          weeklyMetrics[4].totalGoals);
  DataPoints lineData6 = DataPoints(
      day: weeklyMetrics[5].dayOfWeek,
      val: weeklyMetrics[5].overallProgressPrcnt,
      val2: ((weeklyMetrics[5].durationPrcnt * weeklyMetrics[5].numLongGoals) +
              (weeklyMetrics[5].numShortGoals * 100)) /
          weeklyMetrics[5].totalGoals);
  DataPoints lineData7 = DataPoints(
      day: weeklyMetrics[6].dayOfWeek,
      val: weeklyMetrics[6].overallProgressPrcnt,
      val2: ((weeklyMetrics[6].durationPrcnt * weeklyMetrics[6].numLongGoals) +
              (weeklyMetrics[6].numShortGoals * 100)) /
          weeklyMetrics[6].totalGoals);
  return [
    lineData1,
    lineData2,
    lineData3,
    lineData4,
    lineData5,
    lineData6,
    lineData7
  ];
}

dynamic setPieData(goalList) {
  double totalLTduration = 0;
  double totalTimeDedicated = 0;
  List<String> pieDataset = [];
  String noProgress = '';
  if (goalList.isNotEmpty) {
    for (var goal in goalList) {
      if ((goal?.isCompleted == false) & (goal.isLongTerm == true)) {
        totalLTduration = totalLTduration + goal.duration;
        totalTimeDedicated = totalTimeDedicated + goal.timeDedicated;
        if (goal.timeDedicated == 0) {
          noProgress = '$noProgress<br/>${goal.goalTitle}';
        }
        String data =
            "{value: ${double.parse((goal.goalTimeDedicated).toStringAsFixed(2))}, name:'${goal.goalTitle}'}";
        pieDataset.add(data);
      } else if ((goal?.isCompleted == true) & (goal.isLongTerm == true)) {
        if (((goal.goalCompletionDate?.isBefore(todaysDate)) ||
                goal.goalCompletionDate?.isAtSameMomentAs(todaysDate)) &
            goal.goalCompletionDate
                ?.isAfter(todaysDate.subtract(const Duration(days: 7)))) {
          String data =
              "{value: ${double.parse((goal.goalTimeDedicated).toStringAsFixed(2))}, name:'${goal.goalTitle}'}";
          pieDataset.add(data);
        }
      }
    }
  } else {
    pieDataset = ["{value: 0, name:'No Longterm data'}"];
  }

  double incompleteDuration = totalLTduration - totalTimeDedicated;

  return [pieDataset, totalTimeDedicated, incompleteDuration];
}

/// this class represents a single slice in a pie chart

List<DataPoints> setBarData(List<MetricsData> weeklyMetrics) {
  DataPoints barData1 = DataPoints(
      day: weeklyMetrics[0].dayOfWeek,
      val: weeklyMetrics[0].numShortGoals,
      val2: weeklyMetrics[0].numSTcompleted);
  DataPoints barData2 = DataPoints(
      day: weeklyMetrics[1].dayOfWeek,
      val: weeklyMetrics[1].numShortGoals,
      val2: weeklyMetrics[1].numSTcompleted);
  DataPoints barData3 = DataPoints(
      day: weeklyMetrics[2].dayOfWeek,
      val: weeklyMetrics[2].numShortGoals,
      val2: weeklyMetrics[2].numSTcompleted);
  DataPoints barData4 = DataPoints(
      day: weeklyMetrics[3].dayOfWeek,
      val: weeklyMetrics[3].numShortGoals,
      val2: weeklyMetrics[3].numSTcompleted);
  DataPoints barData5 = DataPoints(
      day: weeklyMetrics[4].dayOfWeek,
      val: weeklyMetrics[4].numShortGoals,
      val2: weeklyMetrics[4].numSTcompleted);
  DataPoints barData6 = DataPoints(
      day: weeklyMetrics[5].dayOfWeek,
      val: weeklyMetrics[5].numShortGoals,
      val2: weeklyMetrics[5].numSTcompleted);
  DataPoints barData7 = DataPoints(
      day: weeklyMetrics[6].dayOfWeek,
      val: weeklyMetrics[6].numShortGoals,
      val2: weeklyMetrics[6].numSTcompleted);
  return [barData1, barData2, barData3, barData4, barData5, barData6, barData7];
}
