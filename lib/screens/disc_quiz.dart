import 'dart:async';
import 'dart:convert';
import 'package:disc/screens/rulebookdisc.dart';
import 'package:disc/services/model.dart';
import 'package:disc/services/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'discanalysis.dart';

Future<Album>   fetchAlbum(int i) async {
  final response = await http.get('http://192.168.68.103:1337/QuestionDbs');
  //Linked with visahan.tk/animals
  // final response = await http.get('https://visahan.tk/animals.json');
  final jsonresponse = json.decode(response.body);
  return Album.fromJson(jsonresponse[i]);
}
class DISC_quiz extends StatefulWidget {
  final Questioncount questioncount;
  final Questioncount one;
  final Questioncount two;
  final Questioncount three;
  final Questioncount four;


  DISC_quiz({Key key, @required this.questioncount, @required this.one, @required this.two, @required this.three, @required this.four}) : super(key: key);

  @override
  DISC_quizstate createState() => DISC_quizstate(this.questioncount,this.one,this.two,this.three,this.four);

}
  Future<Album> futureAlbum;

class DISC_quizstate extends State<DISC_quiz>{

  final Questioncount questioncount;
  final Questioncount one;
  final Questioncount two;
  final Questioncount three;
  final Questioncount four;

  DISC_quizstate(this.questioncount, this.one, this.two, this.three, this.four);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    //Declaration of variables
    int question_index =questioncount.questionindex;
    int one = questioncount.one;
    int two =questioncount.two;
    int three =questioncount.three;
    int four =questioncount.four;

    print(one);
    print(two);
    print(three);
    print(four);
    print("--------");


    //Initialising the api
    if(question_index<10) {
      futureAlbum = fetchAlbum(question_index);
    }

    bool pressAttention=false;
    bool firstoption=false;
    bool secondoption=false;
    bool thirdoption=false;
    bool fourthoption=false;

    int tap=0;

    return Scaffold(
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
              Container(height: 50),
              Container(
                height: 150.0,
                width: 300.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: new Center(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: FutureBuilder<Album>(
                          future: futureAlbum,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(snapshot.data.question,
                                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold));
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    )),
              ),
              Container(height:120),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
                  if(question_index<10) {
                    if(tap==0) {
                      firstoption=true;
                      tap=1;
                      one=one+4;
                    }
                    else {
                      if(firstoption==true) {
                        return;
                      }
                      tap=0;
                      one=one-2;
                      question_index++;
                      if (question_index==10) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => new discanalysis(
                                    questioncount: new Questioncount(
                                        question_index, one, two, three, four))));
                        return;
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => new DISC_quiz(
                                  questioncount: new Questioncount(
                                      question_index, one, two, three, four))));
                    }
                  }
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.option[0],
                            style: TextStyle(fontSize: 20));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(height:30),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
                  if(question_index<10) {
                    if(tap==0) {
                      secondoption=true;
                      tap=1;
                      two=two+4;
                    }
                    else {
                      if(secondoption==true) {
                        return;
                      }
                      tap=0;
                      two=two-2;
                      question_index++;
                      if (question_index==10) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => new discanalysis(
                                    questioncount: new Questioncount(
                                        question_index, one, two, three, four))));
                        return;
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => new DISC_quiz(
                                  questioncount: new Questioncount(
                                      question_index, one, two, three, four))));
                    }
                  }
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.option[1],
                            style: TextStyle(fontSize: 20));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }// By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(height:30),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
                  if(question_index<10) {
                    if(tap==0) {
                      thirdoption=true;
                      tap=1;
                      three=three+4;
                    }
                    else {
                      if(thirdoption==true) {
                        return;
                      }
                      tap=0;
                      three=three-2;
                      question_index++;
                      if (question_index==10) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => new discanalysis(
                                    questioncount: new Questioncount(
                                        question_index, one, two, three, four))));
                        return;
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => new DISC_quiz(
                                  questioncount: new Questioncount(
                                      question_index, one, two, three, four))));
                    }
                  }
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.option[2],
                            style: TextStyle(fontSize: 20));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(height: 30),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
                  if(question_index<10) {
                    if(tap==0) {
                      fourthoption=true;
                      tap=1;
                      four=four+4;
                    }
                    else {
                      if(fourthoption==true) {
                        return;
                      }
                      tap=0;
                      four=four-2;
                      question_index++;
                      if (question_index==10) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => new discanalysis(
                                    questioncount: new Questioncount(
                                        question_index, one, two, three, four))));
                        return;
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => new DISC_quiz(
                                  questioncount: new Questioncount(
                                      question_index, one, two, three, four))));
                    }
                  }
                },
                textColor: Colors.white,
//                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.option[3],
                            style: TextStyle(fontSize: 20));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(height:50),
            ],
          ),
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.only(left: 15, right: 15),
        ),
      ),
    );
  }
}
