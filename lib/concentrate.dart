import 'package:dichotic/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConcentrateApp extends StatefulWidget {
  const ConcentrateApp({super.key, required this.title});
  final String title;

  @override
  State<ConcentrateApp> createState() => ConcentrateAppState();
}

class ConcentrateAppState extends State<ConcentrateApp> {

    Widget appBar(context) {
      return AppBar(
          title: const Text("Concentrate", style: TextStyle(color: Colors.black)), 
          centerTitle: true,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
        actions: [
          TextButton(
        onPressed: () {},
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
        appBar: appBar,
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
