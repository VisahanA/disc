
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'discproperties.dart';

class disctype extends StatelessWidget {
  Function(Brightness brightness) changeTheme;
  final Person person;

  disctype({Key key, @required this.person}) : super(key: key){
    print(person.value);
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    if(person.value==1) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Dominance'),
          backgroundColor: Colors.redAccent[700],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomCenter,
                  stops: [0.6, 1],
                  colors: [Colors.white,Colors.redAccent[200]])
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
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: '1)	Give brief details only.\n 2)	Avoid telling too much of generalizations.\n 3)	Never repeat the same things over again \n4)	Focus on solutions rather than problem. \n5)	Best way to present content is using bulletin points. \n 6)	Use superlative words.Beware of the “what” questions D’s will throw on you!!',
                    style: DefaultTextStyle.of(context).style,
                  ),
                )
//              Container(height: 40),
              ],
            ),
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.only(left: 15, right: 15),
          ),
        ),
      );
    }
    else if(person.value==2){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Influence'),
          backgroundColor: Colors.yellowAccent[700],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomCenter,
                  stops: [0.6, 1],
                  colors: [Colors.white,Colors.yellowAccent[200]])
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
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
//              Container(height: 40),
              ],
            ),
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.only(left: 15, right: 15),
          ),
        ),
      );
    }
    else if(person.value==3) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Steadiness'),
          backgroundColor: Colors.greenAccent[700],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomCenter,
                  stops: [0.6, 1],
                  colors: [Colors.white,Colors.greenAccent[200]])
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
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
//              Container(height: 40),
              ],
            ),
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.only(left: 15, right: 15),
          ),
        ),
      );
    }
    else if(person.value==4) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Conscientiousness'),
          backgroundColor: Colors.blueAccent[700],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomCenter,
                  stops: [0.6, 1],
                  colors: [Colors.white,Colors.blueAccent[200]])
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
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
//              Container(height: 40),
              ],
            ),
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.only(left: 15, right: 15),
          ),
        ),
      );
    }
    else {
      print("check the argument value");
    }
  }
}