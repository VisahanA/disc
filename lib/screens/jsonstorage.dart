// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
//
//
//
// class _ReadWriteFileAppState extends State<ReadWriteFile> {
//   bool _allowWriteFile = false;
//
//   Future get _localPath async {
//     // Application documents directory: /data/user/0/{package_name}/{app_name}
//     final applicationDirectory = await getApplicationDocumentsDirectory();
//
//     // External storage directory: /storage/emulated/0
//     final externalDirectory = await getExternalStorageDirectory();
//
//     // Application temporary directory: /data/user/0/{package_name}/cache
//     final tempDirectory = await getTemporaryDirectory();
//
//     return applicationDirectory.path;
//   }
//
//   Future get _localFile async {
//     final path = await _localPath;
//
//     return File('$path/counterxxx.txt');
//   }
//
//   Future _writeToFile(String text) async {
//     if (!_allowWriteFile) {
//       return null;
//     }
//
//     final file = await _localFile;
//
//     // Write the file
//     File result = await file.writeAsString('$text');
//
//     if (result == null ) {
//       print("Writing to file failed");
//     } else {
//       print("Successfully writing to file");
//
//       print("Reading the content of file");
//       String readResult = await _readFile();
//       print("readResult: " + readResult.toString());
//     }
//   }
//
//   Future _readFile() async {
//     try {
//       final file = await _localFile;
//
//       // Read the file
//       return await file.readAsString();
//     } catch (e) {
//       // Return null if we encounter an error
//       return null;
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _requestWritePermission();
//   }
//
//   _requestWritePermission() async {
//     PermissionStatus permissionStatus = await SimplePermissions.requestPermission(Permission.WriteExternalStorage);
//
//     if (permissionStatus == PermissionStatus.authorized) {
//       setState(() {
//         _allowWriteFile = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     this._writeToFile("Test");
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Writing and Reading File Tutorial'),
//         ),
//         body: Center(
//             child: Text("by Woolha.com")
//         )
//     );
//   }
// }
//
// class ReadWriteFile extends StatefulWidget {
//   @override
//   _ReadWriteFileAppState createState() => new _ReadWriteFileAppState();
// }