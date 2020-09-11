import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:share/share.dart';
import 'home.dart'; // import the package

class discanalysis extends StatelessWidget {
  final Questioncount questioncount;
  final Questioncount one;
  final Questioncount two;
  final Questioncount three;
  final Questioncount four;

  discanalysis({Key key, @required this.questioncount, @required this.one, @required this.two, @required this.three, @required this.four}) : super(key: key);
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

    double one = ((questioncount.one).toDouble());
    double two =((questioncount.two).toDouble());
    double three =((questioncount.three).toDouble());
    double four =((questioncount.four).toDouble());
    //Declaration of variables
    if(questioncount.one<0){
      one=0;
    }
    if(questioncount.two<0){
      two=0;
    }
    if(questioncount.three<0){
      three=0;
    }
    if(questioncount.four<0){
      four=0;
    }



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
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topCenter,
                end:Alignment.bottomCenter,
                stops: [0.6, 1],
                colors: [Colors.white,Colors.pinkAccent[100]])
        ),
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
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.blueAccent[700],
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyHomePage()));
              },
              textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    'Go to Main page',
                    style: TextStyle(fontSize: 18)
                ),
              ),
            ),
            Container(height:20),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.blueAccent[700],
              onPressed: () {
                Share.share('You are an Introvert');
              },
              textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    'Share DISC results',
                    style: TextStyle(fontSize: 18)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}