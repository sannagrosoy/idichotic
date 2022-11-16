import 'dart:async';

import 'package:dichotic/Start_Promt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dichotic/sounds.dart';
import 'package:dichotic/listen.dart';



class LoadingApp extends StatefulWidget {
  const LoadingApp({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => LoadingAppState();
}

class LoadingAppState extends State<LoadingApp>  {  

    @override
    void initState() {
      super.initState();
      startTimer();
    }

    startTimer() async {
      var duration = Duration(seconds: 4);
      return Timer(duration, route);
    }

    route(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => ListenApp(title: "listen")
      ));
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You have 3 seconds"),
              Container(height: 6),
              CircularProgressIndicator(),
            ],
          )
        )
      );
    }
}

