import 'package:flutter/material.dart';
import 'package:iti_final_project/screens/login.dart';
import 'package:iti_final_project/screens/scr2.dart';
import 'package:iti_final_project/screens/signup.dart';
import 'wepage.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner:false,
     theme: ThemeData
    (primarySwatch: Colors.amber,
      canvasColor: Colors.white,
      //iconTheme: const IconThemeData(color: Colors.white,size: 40),
    ),
home:LOGIN(),
//home:TABS_SCREEN(),
//    home:welpage() ,

  ));
}