import 'dart:async';

import 'package:dichotic/Start_Promt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dichotic/sounds.dart';
import 'package:dichotic/listen.dart';



class LoadingConsApp extends StatefulWidget {
  const LoadingConsApp({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => LoadingConsAppState();
}

class LoadingConsAppState extends State<LoadingConsApp>  {  

    @override
    void initState() {
      super.initState();
      startTimer();
    }

    startTimer() async {
      var duration = Duration(seconds: 5);
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
            children: [
              Container(
                height: 40,
                child:
                Text("Concentrate on the", style: TextStyle(fontSize: 24))),
              Container(
                height: 40,
                child:
                Text("RIGHT EAR", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              Container(
                child: 
                Icon(Icons.arrow_forward, size: 70),),
            ] ,
          )
        )
      );
    }
}

