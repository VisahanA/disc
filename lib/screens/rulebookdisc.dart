import 'package:disc/screens/disc_quiz.dart';
import 'package:disc/services/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';


class rulebook extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  rulebook({Key key, this.title})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }

  final String title;

  @override
  rulebookstate createState() => rulebookstate();
}

class rulebookstate extends State<rulebook> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        appBar: AppBar(
        title: const Text('Rules to attend disc test'),
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
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Row(
              ),
              Text(
                  'Welcome to the DISC test!!\n',
                  style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold),
              ),
              Text(
               '\rDISC personality test determines your personality profile based on DISC types. DISC is an acronym with a simple expansion of Dominance, Influence, Steadiness and Conscientiousness. Each one of us in this world are unique, but we may have few behavioural things in general which can be described into the four types mentioned above. Once you are able to understand this DISC, you will be able to understand yourself better and also know how to handle others effectively. It’s time to take your test, click on take DISC test and get started.',
                maxLines: 20,
                softWrap: true,
                style: TextStyle(fontSize:20),
              ),
              Container(height:20),
              Text(
                'RULE BOOK: \n',
                style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Rule 1: You should answer the questions immediately as you read, without thinking much. \n\n'
                    ' Rule 2: You will have to choose two options, option 1 should be the one which you do actually (best-case scenario), and option two should be the one you would never do (worst-case scenario).',
                maxLines: 10,
                softWrap: true,
                style: TextStyle(fontSize:20),
              ),
              Container(height: 20),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => DISC_quiz(questioncount: new Questioncount(0,0,0,0,0))));
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Start disc test',
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