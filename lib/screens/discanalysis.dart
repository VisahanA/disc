import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'home.dart'; // import the package

class discanalysis extends StatelessWidget {
  final Questioncount questioncount;
  final Questioncount one;
  final Questioncount two;
  final Questioncount three;
  final Questioncount four;

  discanalysis({Key key, @required this.questioncount, @required this.one, @required this.two, @required this.three, @required this.four}) : super(key: key){

  }
  Map<String, double> data = new Map();
  bool _loadChart = false;

  List<Color> _colors = [
    Colors.redAccent[700],
    Colors.amberAccent[700],
    Colors.greenAccent[700],
    Colors.blueAccent[700],
  ];

  @override
  Widget build(BuildContext context) {

    //Declaration of variables
    double one = ((questioncount.one).toDouble());
    double two =((questioncount.two).toDouble());
    double three =((questioncount.three).toDouble());
    double four =((questioncount.four).toDouble());


    data.addAll({
      'Dominance': one,
      'Influence': two,
      'Steadiness': three,
      'Conscientiousness': four
    });
    _loadChart = true;
    return Scaffold(
      appBar: AppBar(
        title: Text("DiscAnalysis"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
              'DISC Analysis',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            _loadChart ? PieChart(
              dataMap: data,
              colorList:
              _colors, // if not declared, random colors will be chosen
              animationDuration: Duration(milliseconds: 1500),
              chartLegendSpacing: 16.0,
              chartRadius: 200 , //determines the size of the chart
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              showLegends: true,
              legendPosition:
              LegendPosition.right, //can be changed to top, left, bottom
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.disc, //can be changed to ChartType.ring
            ) : SizedBox(
              height: 300,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}