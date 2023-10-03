import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:metrics_ui/src/Metrics/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

import 'data_points.dart';

class LineEchart extends StatefulWidget {
  List<DataPoints> data;
  late String chartTextColor;
  LineEchart({Key? key, required this.data}) : super(key: key);

  @override
  State<LineEchart> createState() => _LineEchartState();
}

class _LineEchartState extends State<LineEchart> {
  @override
  Widget build(BuildContext context) {
    //ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    // if (themeProvider.isDarkMode) {
       widget.chartTextColor = "#FFFFFF";
    // } else {
    //   widget.chartTextColor = "#000000";
    // }

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.8,
      child: Echarts(
        option: '''
    {

      title: {
        left: 'center',
        top: 5,
        text: 'Overall Progress',
        textStyle: {
      color: '${widget.chartTextColor}',
      fontFamily: 'serif'
    }
      },
      tooltip: {
        
    },

    

      grid: {
    left: 38,
    right: 20,
    bottom: 25,
    top: 35 
  },

      xAxis: [{
        type: 'category',
        data: ['${widget.data.elementAt(0).day}',
        '${widget.data.elementAt(1).day}', 
        '${widget.data.elementAt(2).day}', 
        '${widget.data.elementAt(3).day}', 
        '${widget.data.elementAt(4).day}', 
        '${widget.data.elementAt(5).day}',
        {value :'${widget.data.elementAt(6).day}', 
        textStyle: {
          color: '${widget.chartTextColor}',
          
          }
        }],
        
        
      }],
      yAxis: [{
        type: 'value',
        max: 100,
        axisLabel: {
    formatter: "{value}%"
  }
      }],
      series: [{
        
        data: [ ${double.parse(widget.data[0].val.toStringAsFixed(2))},
        ${double.parse(widget.data[1].val.toStringAsFixed(2))}, 
        ${double.parse(widget.data[2].val.toStringAsFixed(2))}, 
        ${double.parse(widget.data[3].val.toStringAsFixed(2))}, 
        ${double.parse(widget.data[4].val.toStringAsFixed(2))}, 
        ${double.parse(widget.data[5].val.toStringAsFixed(2))}, 
        ${double.parse(widget.data[6].val.toStringAsFixed(2))}], 

        markLine: {
        data: [{ name: "Today's Target Short Term Completion", 
        value: ${double.parse(widget.data[6].val2!.toStringAsFixed(2))}, 
        yAxis: ${double.parse(widget.data[6].val2!.toStringAsFixed(2))} }],

        silent: true,

        

        
        label: 
         {
          position: 'insideStartTop',
          formatter: '{b} ({c}%)',
          textStyle: {
          color: '${widget.chartTextColor}',
          fontFamily: 'serif'
          }
        },
      
      
       emphasis: {
        disabled: true
      },
      },
        type: 'line',
        smooth: true,
        showSymbol: true,
        lineStyle: {
          color: '#F7AD19'
        }, 
        itemStyle: {
        color: '#FF7D02'
      }
      
      }


    ]

    }
  ''',
      ),
    );
  }
}
