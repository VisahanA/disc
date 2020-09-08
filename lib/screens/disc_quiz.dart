import 'dart:async';
import 'dart:convert';

import 'package:disc/services/model.dart';
import 'package:disc/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:outline_material_icons/outline_material_icons.dart';

Future<Album>   fetchAlbum() async {
  final response = await http.get('http://192.168.0.109:1337/QuestionDbs');

  //Linked with visahan.tk/animals
  // final response = await http.get('https://visahan.tk/animals.json');
  final jsonresponse = json.decode(response.body);

  return Album.fromJson(jsonresponse[0]);

}

class DISC_quiz extends StatefulWidget {
  DISC_quiz({Key key}) : super(key: key);

  @override
  DISC_quizstate createState() => DISC_quizstate();
}

class DISC_quizstate extends State<DISC_quiz> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

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
              Container(height:150),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
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
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
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
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(height:30),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
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

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(height: 30),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: containerColor,
                onPressed: () {
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