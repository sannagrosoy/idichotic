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
  AudioPlayer player = AudioPlayer();
  List<String> sounds = ["assets/audio/Ba-Ba.wav", "assets/audio/Ba-Da.wav",
    "assets/audio/Ba-Ga.wav", "assets/audio/Ba-Ka.wav", "assets/audio/Ba-Pa.wav",
    "assets/audio/Ba-Ta.wav", "assets/audio/Da-Ba.wav", "assets/audio/Da-Da.wav",
    "assets/audio/Da-Ga.wav", "assets/audio/Da-Ka.wav", "assets/audio/Da-Pa.wav",
    "assets/audio/Da-Ta.wav", "assets/audio/Ga-Ba.wav", "assets/audio/Ga-Da.wav",
    "assets/audio/Ga-Ga.wav", "assets/audio/Ga-Ka.wav", "assets/audio/Ga-Pa.wav",
    "assets/audio/Ga-Ta.wav", "assets/audio/Ka-Ba.wav", "assets/audio/Ka-Da.wav",
    "assets/audio/Ka-Ga.wav", "assets/audio/Ka-Ka.wav", "assets/audio/Ka-Pa.wav",
    "assets/audio/Ka-Ta.wav", "assets/audio/Pa-Ba.wav", "assets/audio/Pa-Da.wav",
    "assets/audio/Pa-Ga.wav", "assets/audio/Pa-Ka.wav", "assets/audio/Pa-Pa.wav",
    "assets/audio/Pa-Ta.wav", "assets/audio/Ta-Ba.wav", "assets/audio/Ta-Da.wav",
    "assets/audio/Ta-Ga.wav", "assets/audio/Ta-Ka.wav", "assets/audio/Ta-Pa.wav",
    "assets/audio/Ta-Ta.wav"];
  int sound_index = 0;
  int Same_sound_correct = 0;
  int Same_sound_incorrect = 0;
  int Left_correct = 0;
  int Right_correct = 0;
  int wrong = 0;
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
  void initState(){
    // TODO: implement initState
    super.initState();
    String filepath = sounds[sound_index];
    play(filepath, player);
  }
  void play(String filepath, AudioPlayer player) async{
    String filepath = sounds[sound_index];
    ByteData bytes = await rootBundle.load(filepath);
    Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(audiobytes);
    if(result != 1){ //play success
      print("Error while playing audio.");
    }
  }
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;
    sounds.shuffle();
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
            name: "Ta",
            app: this,
            text1: Text("TA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            name: "Ga",
              app: this,
            text1: Text("GA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            name: "Ka",
              app: this,
            text1: Text("KA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4)]),

          Column(
          children: <Widget> [
          CustomContainer(
            name: "Ba",
              app: this,
            text1: Text("BA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            name: "Da",
              app: this,
            text1: Text("DA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("PA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.28,
            containerWidth: screenWidth * 0.4,
            name: "Pa",
            app: this,)
          
        ],)
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
  final String name;
  final double containerHeight;
  final double containerWidth;
  final ListenAppState app;

  CustomContainer({
    required this.text1, required this.containerHeight, required this.containerWidth, required this.app, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        height: containerHeight,
        width: containerWidth,
        child:
        OutlinedButton(
            onPressed: () {
              if (app.sound_index < app.sounds.length) {
                scoreLogic();
                app.sound_index++;
              }
              if (app.sound_index < app.sounds.length - 1) {
                app.sound_index++;
                String filepath = app.sounds[app.sound_index];
                app.play(filepath, app.player);
              } else {
                print(app.Right_correct);
                print(app.Left_correct);
                print(app.Same_sound_correct);
                print(app.Same_sound_incorrect);
                print(app.wrong);
              }
            },
            style: OutlinedButton.styleFrom(
              //backgroundColor: Colors.white,
                elevation: 3,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Container(child: text1))
    );
  }

  void scoreLogic() {
    String oldfilepath = app.sounds[app.sound_index];
    List<String> sounds = oldfilepath.split("/");
    String filename = sounds[sounds.length - 1];
    List<String> sounds_2 = filename.split(".");
    String sound_2 = sounds_2[0];
    List<String> sound = sound_2.split("-");
    if (sound.contains(name)) {
      if (sound[0] == sound[1]) {
        app.Same_sound_correct++;
      } else if (sound[0] == name) {
        app.Left_correct++;
      } else {
        app.Right_correct++;
      }
    } else if (sound[0] != sound[1]) {
      app.wrong++;
    } else {
      app.Same_sound_incorrect++;
    }
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
