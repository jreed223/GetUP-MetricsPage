import 'package:flutter/material.dart';
import 'package:metrics_ui/src/Metrics/Charts/pie_echart.dart';
import 'package:metrics_ui/src/Metrics/theme_provider.dart';
import 'package:provider/provider.dart';

import 'package:text_scroll/text_scroll.dart';
import 'DataHandling/data_points.dart';
import 'Charts/doubleBar_echart.dart';
import 'DataHandling/metrics_controller.dart';
import 'goals.dart';
import 'Charts/line_echart.dart';
import 'DataHandling/metrics_Queue.dart';

class MetricsPage extends StatefulWidget {
  const MetricsPage({super.key});

  @override
  State<MetricsPage> createState() => _MetricsPageState();
}

class _MetricsPageState extends State<MetricsPage> {
  List longTermGoals = [];
  int i = 0;
  List sampleGoalList = [
    LongTermGoal(
      title: 'Learn Flutter',
      duration: 20,
      dateCreated: DateTime.now().subtract(const Duration(days: 6)),
      timeDedicated: 10,
    ),
    LongTermGoal(
      title: 'Read',
      duration: 5,
      dateCreated: DateTime.now().subtract(const Duration(days: 2)),
      timeDedicated: 2,
    ),
    LongTermGoal(
        title: 'Learn Dart',
        duration: 7,
        dateCreated: DateTime.now().subtract(const Duration(days: 3)),
        timeDedicated: 7),
    Goal(
        title: 'Go to the gym',
        isCompleted: false,
        dateCreated: DateTime.now().subtract(const Duration(days: 6))),
    Goal(
        title: 'Go to the gym',
        isCompleted: true,
        dateCreated: DateTime.now().subtract(Duration(days: 5))),
    Goal(
        title: 'Go to the gym',
        isCompleted: false,
        dateCreated: DateTime.now().subtract(Duration(days: 5))),
    Goal(
        title: 'Go to the gym',
        isCompleted: true,
        dateCreated: DateTime.now().subtract(Duration(days: 3))),
    Goal(
        title: 'Go to the gym',
        isCompleted: false,
        dateCreated: DateTime.now().subtract(Duration(days: 2))),
    Goal(
        title: 'Go to the gym',
        isCompleted: false,
        dateCreated: DateTime.now().subtract(Duration(days: 2))),
    Goal(
        title: 'Go to the gym',
        isCompleted: false,
        dateCreated: DateTime.now().subtract(Duration(days: 1))),
    Goal(
        title: 'Go to the gym',
        isCompleted: false,
        dateCreated: DateTime.now().subtract(Duration(days: 0)))
  ];
  //var chartTextColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    themeProvider.toggleTheme(themeProvider.isDarkMode);

    Color scaffoldColor = themeProvider.scaffoldColor;
    Color textColor = themeProvider.textColor;
    Color buttonColor = themeProvider.buttonColor;
    Color unselectedButton = themeProvider.unselectedButton;

    //return Consumer<GoalDataState>(builder: (context, provider, child) {
    List<MetricsData> metricsQueue = MetricsQueue().setMetricsQ(sampleGoalList);

    List<DataPoints> lineData = setLineData(metricsQueue);
    List<DataPoints> barData = setBarData(metricsQueue);
    List pieData = setPieData(sampleGoalList);

    for (var goal in sampleGoalList) {
      if (goal.isLongTerm) {
        longTermGoals.add(goal);
      }
    }

    //ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: scaffoldColor,
        title: Text('Daily Data',
            style: TextStyle(
                color: textColor,
                fontFamily: 'PT-Serif',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 1.5)),
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          //Centers column vertically on y axis
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: LineEchart(data: lineData),
                ),
              ],
            ),

            ///This lays the button side by side
            Row(
              ///Centers row horizontally on x axis
              mainAxisSize: MainAxisSize.max,

              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 2.5,
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width / 14,
                          horizontal: MediaQuery.of(context).size.width / 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: longTermGoals[i].isCompleted
                                ? const Color.fromARGB(255, 255, 144, 39)
                                    .withOpacity(0)
                                : const Color.fromARGB(255, 255, 144, 39),
                            width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              child: TextScroll(
                                fadedBorderWidth: .05,
                                fadedBorder: true,
                                pauseBetween: const Duration(seconds: 3),
                                velocity: const Velocity(
                                    pixelsPerSecond: Offset(50, 0)),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: textColor,
                                    fontFamily: 'PT-Serif',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                                (longTermGoals.isNotEmpty
                                    ? "${longTermGoals[i].title}"
                                    : "No Long Term Data"),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: longTermGoals[i].isCompleted
                                    ? const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 39, 203, 124),
                                            Color.fromARGB(255, 22, 161, 24),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      )
                                    : const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 144, 39)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: FittedBox(
                                        alignment: Alignment.centerRight,
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'PT-Serif',
                                              fontSize: 40,
                                              fontWeight: FontWeight.w800,
                                            ),
                                            (longTermGoals.isNotEmpty
                                                ? "${double.parse((longTermGoals[i].duration - longTermGoals[i].timeDedicated).toStringAsFixed(2))}"
                                                : '0')),
                                      ),
                                    ),
                                    const Expanded(
                                      child: FittedBox(
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'PT-Serif',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                            "Hours\nRemain"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: textColor,
                                      fontFamily: 'PT-Serif',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  (longTermGoals.isNotEmpty
                                      ? "${(double.parse((longTermGoals[i].goalProgress * 100).toStringAsFixed(2)))}% Complete "
                                      : '')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: PieEchart(data: pieData),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 20,
                      bottom: MediaQuery.of(context).size.width / 14,
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: GestureDetector(onTap: () {
                        setState(() {
                          i += 1;
                          if (i >= longTermGoals.length) {
                            i = 0;
                          }
                        });
                        print('Tapped Container');
                      }),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DoubleBarEchart(
                  data: barData,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: scaffoldColor,
        selectedItemColor: buttonColor,
        unselectedItemColor: unselectedButton,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Metrics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
    //});
  }
}
