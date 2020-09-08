import 'package:disc/screens/disctypes.dart';
import 'package:disc/services/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:toast/toast.dart';


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
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('DISC PROPERTIES'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomCenter,
                  stops: [0.4, 1],
                  colors: [Colors.white,primaryColor])
          ),
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
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new disctype(person: new Person(1))));
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
                color: Colors.yellow[600],
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new disctype(person: new Person(2))));
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
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new disctype(person: new Person(3))));
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
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new disctype(person: new Person(4))));
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
    ));
  }

}

class Person {
  final int value;

  Person(this.value);
}