import 'package:disc/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:disc/screens/rulebookdisc.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:share/share.dart';
import 'package:confetti/confetti.dart';

// ignore: camel_case_types
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

// ignore: camel_case_types
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
    int flag=0;
    data.addAll({
      'Dominance': one,
      'Influence': two,
      'Steadiness': three,
      'Conscientiousness': four
    });
    double largest= (one>two)?(one>three)?(one>four)?one:four:(three>four)?three:four:(two>three)?(two>four)?two:four:(three>four)?three:four;
    String val="";
    if(largest==one) {
      flag++;
      val=
       'HEY D’s! \nIf you are a high D person, you are more like an eagle, you are very direct, result-oriented, good at taking decisions, fast-paced, and confident about whatever you do.\nYou always look forward for new opportunities, and love to have control of the entire group you are in.\nYou are on time to every meeting, and follow your schedule perfectly.\nYour main goals would be accomplishing something which is unique and to have a great independence.To improvise on yourself, you should work on being patient,\nand should listen to details keenly.Your greatest stress reliever would be doing physical activities.\nCelebrity person in style D is Donald Trump.\nKeep going and achieve all your goals!!!!\n\n';
    }
    if(largest==two) {
      if (flag == 1) {
        flag++;
        val = val +'\n'+
            'Hey I’s! \nIf you are a high I person, you are more like a parrot, you are talkative, inspirational and an optimistic person.\nYou always keep the environment you are in with lot of energy and enthusiasm.\nYou never like being ignored or isolated, you always wanted a group of people around you.\nYour main goals would be creating strong relationships and being happy always.To improvise on yourself, you must research on all the facts before you publish to someone, and stay focused on your goals.Your greatest stress reliever would be talking to your close ones.Celebrity person in style I is Will Smith.\nContinue to spread the positive vibes!!';
      }
      else {
        val =
        'Hey I’s! \nIf you are a high I person, you are more like a parrot, you are talkative, inspirational and an optimistic person.\nYou always keep the environment you are in with lot of energy and enthusiasm.\nYou never like being ignored or isolated, you always wanted a group of people around you.\nYour main goals would be creating strong relationships and being happy always.To improvise on yourself, you must research on all the facts before you publish to someone, and stay focused on your goals.Your greatest stress reliever would be talking to your close ones.Celebrity person in style I is Will Smith.\nContinue to spread the positive vibes!!';
      }
    }
    if(largest==three) {
      if (flag == 1) {
        flag++;
        val = val + '\n' +
            'Hey S’s!\nIf you are a high I person, you are more like a dove, you get along with everyone easily, harmonious and a good listener.\nYou are always ready to help others, co-operative and like to be reserved.\nYou never like changes that makes you come out of your comfortable zone.\nYour main goals would be personal accomplishment and group acceptance.To improvise on yourself, you need to try on multitasking, and adapt to change.Your greatest stress reliever would be a good sleep.Celebrity person in style S is David Beckham.\nYour friendship is what the world needs!!';
      }
      else {
        val =
        'Hey S’s!\nIf you are a high I person, you are more like a dove, you get along with everyone easily, harmonious and a good listener.\nYou are always ready to help others, co-operative and like to be reserved.\nYou never like changes that makes you come out of your comfortable zone.\nYour main goals would be personal accomplishment and group acceptance.To improvise on yourself, you need to try on multitasking, and adapt to change.Your greatest stress reliever would be a good sleep.Celebrity person in style S is David Beckham.\nYour friendship is what the world needs!!';
      }
    }
    if(largest==four) {
      if (flag == 1) {
        val = val + '\n' +
            'Hey C’s!\nIf you are a high C person, you are more like an Owl, you are very detail-oriented, and always have a plan and process to do something.\nYou are conscious, curious and accuracy is always what you need.\nYou tend to ask a lot of questions, and quality – oriented person.\nYour main goals would be correctness and personal growth.To improvise on yourself, you need to work on compromising things when you are in a team, and to make quick decisions.Your greatest stress reliever would be meditation or deep breaths.Celebrity person in style C is Bill Gates.\nStep out and conquer the world with your facts!!';
      }
      else {
        val =
        'Hey C’s!\nIf you are a high C person, you are more like an Owl, you are very detail-oriented, and always have a plan and process to do something.\nYou are conscious, curious and accuracy is always what you need.\nYou tend to ask a lot of questions, and quality – oriented person.\nYour main goals would be correctness and personal growth.To improvise on yourself, you need to work on compromising things when you are in a team, and to make quick decisions.Your greatest stress reliever would be meditation or deep breaths.Celebrity person in style C is Bill Gates.\nStep out and conquer the world with your facts!!';
      }
    }
    _loadChart = true;
    return new WillPopScope(
        // ignore: missing_return
        onWillPop: () async {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>  MyHomePage()));
        },
      child: new Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          title: Text("Disc analysis"),
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Share.share(sharecontent(one,two,three,four));
            },
            child: Icon(
              OMIcons.share,
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
           ),
          ],
        ),
      body: Container(
      child: new SingleChildScrollView(
          child: Column(
            // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                height: 50,
              ),
              Text(val,
                maxLines: 40,
                softWrap: true,
                style: TextStyle(fontSize:20),
              ),
            ],
          ),
        ),
      ),
     ),
    );
  }
  String sharecontent(one,two,three,four) {
    double largest= (one>two)?(one>three)?(one>four)?one:four:(three>four)?three:four:(two>three)?(two>four)?two:four:(three>four)?three:four;
    String value="";

    if(largest==one) {
      value='Hey guys! I belong to the most interesting behavior profile called Dominance(extrovert)! Want to know yours?? \n https://play.google.com/store/apps/details?id=com.personality.disc';
    }

    if(largest==two) {
        value='Hey guys! I belong to the most interesting behavior profile called Influence(extrovert)! Want to know yours?? \n https://play.google.com/store/apps/details?id=com.personality.disc';
    }

    if(largest==three) {
        value='Hey guys! I belong to the most interesting behavior profile called Steadiness(introvert)! Want to know yours?? \nhttps://play.google.com/store/apps/details?id=com.personality.disc';
    }

    if(largest==four) {
      value='Hey guys! I belong to the most interesting behavior profile called Conscientiousness(introvert)! Want to know yours?? \nhttps://play.google.com/store/apps/details?id=com.personality.disc';
    }
    return value;
  }
}