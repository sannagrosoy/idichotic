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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double containerHeight;



    return Scaffold(
        appBar: AppBar(
          title: const Text("Listen", style: TextStyle(color: Colors.black, shadows: [Shadow(blurRadius: 10, color: Colors.black, offset: Offset(2.0, 2.0))])), 
          centerTitle: true,
          shadowColor: Colors.white,
          backgroundColor: Colors.white
        ),
        body: Container(
            child: Center( 
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Row(
                  children: [
                    Container(
                    child: 
                    OutlinedButton(   
                    onPressed: () {print("TA");},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      elevation: 3, 
                      shadowColor: Colors.black, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                      child: Container(child: Text("TA")))),

                  Container(child: 
                    OutlinedButton(                    
                    onPressed: () {print("BA");},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      elevation: 3, 
                      shadowColor: Colors.black, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                      child: Container(child: Text("BA"))))]), 
                
                Row(children: <Widget>[
                  Container(
                    child: Container(child: 
                    OutlinedButton(                    
                    onPressed: () {print("GA");},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      elevation: 3, 
                      shadowColor: Colors.black, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                      child: Container(child: Text("GA"))))),

                  Container(
                    child: Container(child: 
                    OutlinedButton(                    
                    onPressed: () {print("DA");},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      elevation: 3, 
                      shadowColor: Colors.black, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                      child: Container(child: Text("DA")))))]),
                                
                                
                Row(children: <Widget>[
                  Container(
                    child: Container(
                    child: 
                    OutlinedButton(                    
                    onPressed: () {print("KA");},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      elevation: 3, 
                      shadowColor: Colors.black, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                      child: Container(child: Text("KA"))))),
                  
                  Container(
                    child: Container(child: 
                    OutlinedButton(                    
                    onPressed: () {print("PA");},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      elevation: 3, 
                      shadowColor: Colors.black, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                      child: Container(child: Text("PA")))))]),

                  Center(
                    child: Container(child: 
                    OutlinedButton(                    
                    onPressed: () {print("Pause");},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      elevation: 3, 
                      shadowColor: Colors.black, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                      child: Container(child: Text("Pause")))))      
              ] 
            )
            
        )
       )
    );
      
  }
}