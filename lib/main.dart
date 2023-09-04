import 'package:flutter/material.dart';
import 'package:xylophone/login/login.dart';
import 'package:xylophone/xylophone.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: xylophone(),
    );
  }

}