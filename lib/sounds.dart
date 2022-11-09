import 'package:dichotic/results.dart';
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
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Column(
          children: <Widget> [
          CustomContainer(
            text1: Text("TA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("GA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("KA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4)]),

          Column(
          children: <Widget> [
          CustomContainer(
            text1: Text("BA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("DA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4),
          CustomContainer(
            text1: Text("PA", style: TextStyle(color: Colors.black, fontSize: 24)),
            containerHeight: (screenHeight-appBarHeight-statusBarHeight) * 0.30,
            containerWidth: screenWidth * 0.4)])
          ]),
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
