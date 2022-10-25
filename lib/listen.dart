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
          title: const Text("The Tests", style: TextStyle(color: Colors.black)), 
          centerTitle: true,
          shadowColor: Colors.white,
          backgroundColor: Colors.white
        );

  var pageroute_listen = MaterialPageRoute(builder: (context) => const ListenApp(title: "Listen"));

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;

    return Scaffold(
        appBar: appBar,
        body: Padding(
            padding: const EdgeInsets.all(70),
            child: Column(
              children: <Widget> [
                CustomButton(
                  text1: const Text("Listen"),
                  text2: const Text("Duration: 3 minutes"), 
                  text3: const Text("In this test you choose the sound you hear the best"), 
                  icon: const Icon(Icons.arrow_right_outlined), 
                  containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.40, 
                  containerWidth: screenWidth * 0.4, 
                  pageroute: pageroute_listen)
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
  final PageRoute pageroute;

  CustomButton({
    required this.text1, required this.text2, required this.text3, required this.icon, required this.containerHeight, required this.containerWidth, required this.pageroute});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: OutlinedButton(           
      onPressed: () {Navigator.push(context, pageroute);},
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white, 
        elevation: 7, 
        shadowColor: Colors.black, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        child: Container(
          height: containerHeight,
          width: containerWidth,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          text1, text2, text3, icon
          ]
        ))
      )
    );
  }

}