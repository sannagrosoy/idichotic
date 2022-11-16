import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dichotic/sounds.dart';

class TestApp extends StatefulWidget {
  const TestApp({super.key, required this.title});
  final String title;

  @override
  State<TestApp> createState() => TestAppState();
}


class TestAppState extends State<TestApp> {  
  
  final appBar = AppBar(
          title: const Text(" ", style: TextStyle(color: Colors.black)), 
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
        );

  var pageroute_listen = () => MaterialPageRoute(builder: (context) => const ListenApp(title: "Listen"));

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;

    return Scaffold(
        appBar: appBar,
        body: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Container(
                  height: (screenHeight-appBarHeight-statusBarHeight) * 0.05,
                ),

                CustomButton(
                  text1: const Text("Listen", style: TextStyle(fontSize: 20, color: Colors.black)),
                  text2: const Text("Duration: 3 minutes", style: TextStyle(fontSize: 12, color: Colors.black)), 
                  text3: const Text("In this test you get presented mutliple sound and you have three seconds to press the button with the sound you hear the best.", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.black)), 
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16), 
                  containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.34, 
                  containerWidth: screenWidth * 0.57, 
                  pageroute: pageroute_listen),

                Container(
                  height: (screenHeight-appBarHeight-statusBarHeight) * 0.08
                ),

                CustomButton(
                  text1: const Text("Concentrate", style: TextStyle(fontSize: 20, color: Colors.black)),
                  text2: const Text("Duration: 5 minutes", style: TextStyle(fontSize: 12, color: Colors.black)), 
                  text3: const Text("In this test you get presented multiple sounds and you have three seconds to press the button with the sound you hear the best.", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.black)), 
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16), 
                  containerHeight:(screenHeight-appBarHeight-statusBarHeight) * 0.34, 
                  containerWidth: screenWidth * 0.57, 
                  pageroute: pageroute_listen),
            ],)
        )
    );
  }
}

class CustomButton extends StatelessWidget {
  final Text text1;
  final Text text2;
  final Text text3;
  final Icon icon;
  final double containerHeight;
  final double containerWidth;
  final MaterialPageRoute Function() pageroute;

  CustomButton({
    required this.text1, required this.text2, required this.text3, required this.icon, required this.containerHeight, required this.containerWidth, required this.pageroute});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlinedButton(           
      onPressed: () {Navigator.push(context, pageroute.call());},
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white, 
        elevation: 7, 
        shadowColor: Colors.black, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        child: Container(
          height: containerHeight,
          width: containerWidth,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, containerHeight*0.1, 0, 0),
              child:text1),
            Padding(
              padding: EdgeInsets.fromLTRB(0, containerHeight*0.015, 0, 0),
              child:text2),
            Padding(
              padding: EdgeInsets.fromLTRB(0, containerHeight*0.03, 0, 0),
              child:text3),
            Padding(
              padding: EdgeInsets.fromLTRB(0, containerHeight*0.07, 0, containerHeight*0.04,),
              child:icon)
          
          ]
        ))
      )
    );
  }
}