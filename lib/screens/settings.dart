import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:link/link.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        ),
                  ),
//Privacy Notes & Licensing
                  buildCardWidget(Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Copyrights',
                          style: TextStyle(
                              fontFamily: 'ZillaSlab',
                              fontSize: 18,
                              color: Colors.white)),
                      Container(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Link(
                            child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  fontFamily: 'ZillaSlab',
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                            url: 'https://disc-d4a8a.web.app/discprivacypolicy.html',
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Link(
                            child: Text(
                                'Terms & Condition',
                                style: TextStyle(
                                  fontFamily: 'ZillaSlab',
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                            url: 'https://disc-d4a8a.web.app/disctermsandcondtions.html',
                          ),
                        ],
                      ),
                    ],
                  )),
                  buildCardWidget(Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('About App',
                          style: TextStyle(
                              fontFamily: 'ZillaSlab',
                              fontSize: 18,
                              color: Colors.white)),
                      Container(
                        height: 20,
                      ),
                      Center(
                        child: Text('Developed'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1)),
                      ),
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                            child: Text(
                              'Visahan',
                              style: TextStyle(fontFamily: 'ZillaSlab', fontSize: 24,color: Colors.white),
                            ),
                          )),
                      Container(
                        alignment: Alignment.center,
                        child: OutlineButton.icon(
                          icon: Icon(OMIcons.link),
                          label: Text('GITHUB',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  color: Colors.white)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onPressed: openGitHub,
                        ),
                      ),
                      Center(
                        child: Text('Content Writer'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1)),
                      ),
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                            child: Text(
                              'Vivitha',
                              style: TextStyle(fontFamily: 'ZillaSlab', fontSize: 24,color: Colors.white),
                            ),
                          )),
                      Container(
                        alignment: Alignment.center,
                        child: OutlineButton.icon(
                          icon: Icon(OMIcons.link),
                          label: Text('INSTAGRAM',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  color: Colors.white)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onPressed: openInstagram,
                        ),
                      ),
                    ],
                  ))
                ],
              ))
        ],
      ),
    );
  }
  Widget buildCardWidget(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueAccent[700],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 8),
                color: Colors.white,
                blurRadius: 16)
          ]),
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(16),
      child: child,
    );
  }
  void openGitHub() {
    launch('https://www.github.com/VisahanA');
  }
  void openInstagram() {
    launch('https://www.instagram.com/stirring_quotes/');
  }

}