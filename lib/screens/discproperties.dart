import 'package:disc/services/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';



class Discproperties extends StatefulWidget {
  Function(Brightness brightness) changeTheme;
  Discproperties({Key key, this.title})
      : super(key: key) {
    this.changeTheme = changeTheme;
  }
  final String title;
  @override
  DiscpropertiesState createState() => DiscpropertiesState();
}

class DiscpropertiesState extends State<Discproperties> {

  @override
  void initState() {
    print("value");
    super.initState();
    // openalertbox();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: const Text('Tips to follow  '),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
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
              Container(height:100),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.red[700],
                onPressed: () {
                  // Navigator.push(context, new MaterialPageRoute(builder: (context) => new disctype(person: new Person(1))));
                  return showDialog(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Domination'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('1)	Give brief details only.\n 2)	Avoid telling too much of generalizations.\n 3)	Never repeat the same things over again \n4)	Focus on solutions rather than problem. \n5)	Best way to present content is using bulletin points. \n 6)	Use superlative words.Beware of the “what” questions D’s will throw on you!! \n\n D + D = Have lot of arguments, but still stay loyal. ',
                              style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Domination',
                      style: TextStyle(fontSize: 28)
                  ),
                ),
              ),
              Container(height:40),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.yellow[700],
                onPressed: () {
                  // Navigator.push(context, new MaterialPageRoute(builder: (context) => new disctype(person: new Person(2))));
                  return showDialog(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Influence'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('1)	Allow them to talk first, else they will not listen to yours.\n 2)	Allow them to ask question in the middle of a conversation. \n 3)	Focus only on the positives. \n4)	Try telling stories.\nBeware of the “who” questions I’s will throw on you!! \n\n I + I = Partying and having fun all the time.',
                                  style: TextStyle(fontSize: 20))
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Influence',
                      style: TextStyle(fontSize: 28)
                  ),
                ),
              ),
              Container(height:40),

              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.green[700],
                onPressed: () {
                  // Navigator.push(context, new MaterialPageRoute(builder: (context) => new disctype(person: new Person(3))));
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Steadiness'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('1) Give more personal details.\n2)Make them comfortable before you start the conversation.\n3) Express lot of interest towards them.\n4)	Never be rude.Beware of the “how” questions S’s will throw on you!! \n\n  S + S = Quiet and peaceful.',
                               style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Steadiness',
                      style: TextStyle(fontSize: 28)
                  ),
                ),
              ),
              Container(height:40),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.blue[700],
                onPressed: () {
                  // Navigator.push(context, new MaterialPageRoute(builder: (context) => new disctype(person: new Person(4))));
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Conscientiousness'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('1)	Focus on facts and details.\n2)	Be 100% sure of what you talk.\n3)	Don’t show too much of emotion.\n4)	Be patient.\nBeware of the “why” questions C’s will throw on you!! \n\n C + C = very calculative on things they do.',
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Conscientiousness',
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

  void openalertbox() {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
}

class Person {
  final int value;

  Person(this.value);
}

//Temp for testing and developement purpose
class Questioncount {
  final int questionindex;
  final int one;
  final int two;
  final int three;
  final int four;

  Questioncount(this.questionindex,this.one,this.two,this.three,this.four);
}