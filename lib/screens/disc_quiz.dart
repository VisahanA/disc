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
import 'dart:math';
import 'package:toast/toast.dart';

Future<Album>   fetchAlbum(int i) async {
  final response = await http.get('https://disc-d4a8a.web.app/disc.json');
  final jsonresponse = json.decode(response.body);
  if (response.statusCode == 200) {
    // print(jsonresponse[i]['Question']);
    return Album.fromJson(jsonresponse[i]);
  }
  else {
    throw Exception('Failed to fetch api');
  }
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
  Set<int> setOfInts = Set();


class DISC_quizstate extends State<DISC_quiz>{

  bool pressAttention=true;
  bool tap=false;
  bool count=false;
  int firstone=0;
  int random_number=0;

  DISC_quizstate(this.questioncount, this.one, this.two, this.three, this.four);

  final Questioncount questioncount;
  final Questioncount one;
  final Questioncount two;
  final Questioncount three;
  final Questioncount four;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //Declaration of variables
    int question_index = questioncount.questionindex;
    int one = questioncount.one;
    int two = questioncount.two;
    int three = questioncount.three;
    int four = questioncount.four;

    //Random question generation
    random_number=Random().nextInt(17);
    bool value=setOfInts.add(random_number);
    print("Set value $setOfInts");
    print(value);

    //Fetch  api
    if((question_index<10) && (tap==false)) {
      print ("random number $random_number");
      while (value==false) {
        random_number=Random().nextInt(17);
        value=setOfInts.add(random_number);
      }
        futureAlbum = fetchAlbum(random_number);
    }
    //To avoid double tap of same option in a particular state
    bool firstoption=false;
    bool secondoption=false;
    bool thirdoption=false;
    bool fourthoption=false;

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Container(
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
              Container(height: 30),
              Container(
                height: 150.0,
                width: 300.0,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        color: questionColor,
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
              Container(height:90),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: pressAttention ?containerColor : Colors.green[700],
                onPressed: () {
                  if(question_index<10) {
                    if(tap==false) {
                      firstoption=true;
                      tap= !tap;
                      pressAttention = !pressAttention;
                      one=one+4;
                      Toast.show("1st option has been choosen", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    }
                    else {
                      if(firstoption==true) {
                        return;
                      }
                      tap=false;
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
                    if(tap==false) {
                      secondoption=true;
                      tap=true;
                      two=two+4;
                      Toast.show("1st option has been choosen", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    }
                    else {
                      if(secondoption==true) {
                        return;
                      }
                      tap=false;
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
                    if(tap==false) {
                      thirdoption=true;
                      tap=true;
                      three=three+4;
                      Toast.show("1st option has been choosen", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    }
                    else {
                      if(thirdoption==true) {
                        return;
                      }
                      tap=false;
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
                    if(tap==false) {
                      fourthoption=true;
                      tap=true;
                      four=four+4;
                      Toast.show("1st option has been choosen", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    }
                    else {
                      if(fourthoption==true) {
                        return;
                      }
                      tap=false;
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

