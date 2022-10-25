import 'dart:ui';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListenApp extends StatefulWidget {
  const ListenApp({super.key, required this.title});
  final String title;

  @override
  State<ListenApp> createState() => ListenAppState();
}


class ListenAppState extends State<ListenApp> {

    final appBar = AppBar(
          title: const Text("Listen", style: TextStyle(color: Colors.black)), 
          centerTitle: true,
          shadowColor: Colors.white,
          backgroundColor: Colors.white
        );

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;

    return Scaffold(
        appBar: appBar,
        body: Center(
        //
        //crossAxisAlignment: CrossAxisAlignment.center,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Column(
          children: <Widget> [
          CustomContainer(
            text1: Text("DA"),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("TA"),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("BA"),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4)]),

          Column(
          children: <Widget> [
          CustomContainer(
            text1: Text("DA"),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("TA"),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("BA"),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4)])

          
        ],)

    )
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Text text1;
  final double containerHeight;
  final double containerWidth;

  CustomContainer({
    required this.text1, required this.containerHeight, required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: containerHeight,
      width: containerWidth,
      child: 
      OutlinedButton(   
      onPressed: () {print("TA");},
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white, 
        elevation: 3, 
        shadowColor: Colors.black, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        child: Container(child: text1))
    );
  }

}