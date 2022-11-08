import 'dart:ui';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:dichotic/results.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListenApp extends StatefulWidget {
  const ListenApp({super.key, required this.title});
  final String title;

  @override
  State<ListenApp> createState() => ListenAppState();
}

var pageroute_results = () => MaterialPageRoute(builder: (context) => Results(title: "Results"));
class ListenAppState extends State<ListenApp> {
    List<String> sounds = ["Ba-Ba.wav", "Ba-Da.wav", "Ba-Ga.wav", "Ba-Ka.wav", "Ba-Pa.wav", "Ba-Ta.wav",
      "Da-Ba.wav", "Da-Da.wav", "Da-Ga.wav", "Da-Ka.wav", "Da-Pa.wav", "Da-Ta.wav",
      "Ga-Ba.wav", "Ga-Da.wav", "Ga-Ga.wav", "Ga-Ka.wav", "Ga-Pa.wav", "Ga-Ta.wav",
      "Ka-Ba.wav", "Ka-Da.wav", "Ka-Ga.wav", "Ka-Ka.wav", "Ka-Pa.wav", "Ka-Ta.wav",
      "Pa-Ba.wav", "Pa-Da.wav", "Pa-Ga.wav", "Pa-Ka.wav", "Pa-Pa.wav", "Pa-Ta.wav",
      "Ta-Ba.wav", "Ta-Da.wav", "Ta-Ga.wav", "Ta-Ka.wav", "Ta-Pa.wav", "Ta-Ta.wav"];
    Widget appBar(context) {
      return AppBar(
          title: const Text("Listen", style: TextStyle(color: Colors.black)), 
          centerTitle: true,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
        actions: [
          TextButton(
        onPressed: () {Navigator.push(context, pageroute_results.call());},
        child: const Text("Results"))
        ],);
    }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;

    return Scaffold(
        appBar: AppBar(
            title: const Text("Listen", style: TextStyle(color: Colors.black)),
            centerTitle: true,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            actions: [
            TextButton(
            onPressed: () {Navigator.push(context, pageroute_results.call());},
        child: const Text("Results")),
    ],
    ),
        body: Center(
        //
        //crossAxisAlignment: CrossAxisAlignment.center,
       child: Column( children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Column(
          children: <Widget> [
          CustomContainer(
            text1: Text("TA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("GA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("KA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4)]),

          Column(
          children: <Widget> [
          CustomContainer(
            text1: Text("BA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("DA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("PA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          ])
          ]
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(screenWidth*0.13, screenHeight*0.05, screenWidth*0.13,0),
            
            child: TimelineWidget())
            
      ],)
    ),
      /*
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.construction),
              label: 'Main Results'

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Details'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_outlined),
              label: 'Animation'
          ),
        ],
      ),*/
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Text text1;
  final double containerHeight;
  final double containerWidth;
  AudioPlayer player = AudioPlayer();

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
       onPressed: () async{
          //print("TA");
        ByteData bytes = await rootBundle.load("assets/audio/Ba-Da.wav");
        Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        int result = await player.playBytes(audiobytes);
        //int result = await player.play("assets/audio/Ba-Da.wav", isLocal: true);
        if(result != 1){ //play success
          print("Error while playing audio.");
        }
        },
      style: OutlinedButton.styleFrom(
        //backgroundColor: Colors.white,
        elevation: 3, 
        backgroundColor: Colors.white,
        shadowColor: Colors.black, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        child: Container(child: text1))
    );
  }

}


class TimelineWidget extends StatefulWidget {
  const TimelineWidget({super.key});


  @override
  State<TimelineWidget> createState() => _TimelineWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _TimelineWidgetState extends State<TimelineWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            LinearProgressIndicator(
              value: controller.value,
              minHeight: 14,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      );
  }
}
