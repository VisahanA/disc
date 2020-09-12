import 'package:disc/screens/rulebookdisc.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:share/share.dart';
import 'home.dart'; // import the package
import 'dart:math';
import 'package:confetti/confetti.dart';

class discanalysis extends StatefulWidget {
  final Questioncount questioncount;
  final Questioncount one;
  final Questioncount two;
  final Questioncount three;
  final Questioncount four;

  discanalysis(
      {Key key, @required this.questioncount, @required this.one, @required this.two, @required this.three, @required this.four})
      : super(key: key);

  @override
  discanalysisstate createState() => discanalysisstate(this.questioncount,this.one,this.two,this.three,this.four);
}

class discanalysisstate extends State<discanalysis>{
  final Questioncount questioncount;
  final Questioncount one;
  final Questioncount two;
  final Questioncount three;
  final Questioncount four;


  Map<String, double> data = new Map();

bool _loadChart = false;

  List<Color> _colors = [
    Colors.redAccent[700],
    Colors.amberAccent[700],
    Colors.greenAccent[700],
    Colors.blueAccent[700],
  ];

  ConfettiController _controllerCenter;
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;
  ConfettiController _controllerTopCenter;
  ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  discanalysisstate(this.questioncount, this.one, this.two, this.three, this.four);

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
    return MaterialApp(
      home:  Scaffold(
      appBar: AppBar(
        title: Text("DiscAnalysis"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topLeft,
                end:Alignment.bottomRight,
                stops: [0.4, 1],
                colors: [Colors.white,Colors.pink[400]])
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't specify a direction, blast randomly
                shouldLoop:
                true, // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
              ),
            ),
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
    ));
  }
}