import 'package:disc/screens/disc_quiz.dart';
import 'package:disc/screens/discanalysis.dart';
import 'package:disc/screens/discproperties.dart';
import 'package:disc/services/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';


class MyHomePage extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  MyHomePage({Key key, this.title})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin:Alignment.topCenter,
              end:Alignment.bottomCenter,
              stops: [0.6, 1],
              colors: [Colors.white,Colors.pinkAccent[100]])
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>  discanalysis(questioncount: new Questioncount(0,0,0,0,0))));
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.centerRight,
                      child: Icon(
                        OMIcons.settings,
                      ),
                    ),
                  ),
                ],
              ),
//              Container(height: 40),
              Image.asset(
                  'assets/disc_menu.png',
                  height: 300,
                  width:  150,
                  fit: BoxFit.cover),
              Container(height:50),
              FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: containerColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DISC_quiz(questioncount: new Questioncount(0,0,0,0,0))));
                  },
                  textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                        'Take Test',
                        style: TextStyle(fontSize: 28)
                    ),
                  ),
                ),
              Container(height:50),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => Discproperties()));
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Know about DISC',
                      style: TextStyle(fontSize: 28)
                  ),
                ),
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.only(left: 15, right: 15),
        ),
      ),
    );
  }
}

class Questioncount {
  final int questionindex;
  final int one;
  final int two;
  final int three;
  final int four;

  Questioncount(this.questionindex,this.one,this.two,this.three,this.four);
}