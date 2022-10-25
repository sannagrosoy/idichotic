import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dichotic/listen.dart';
import 'package:dichotic/settings/settings.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key, required this.title});
  final String title;

  @override
  State<StartApp> createState() => StartAppState();
}

class StartAppState extends State<StartApp> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                // Respond to button press
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestApp(title: "Test"))
                );
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
              ),
              child: Text("Take The Test")
            ),
            OutlinedButton(
              onPressed: () {
                // Respond to button press
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage())
                );
              },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                ),
              child: Text("Settings")
            ),
            OutlinedButton(
              onPressed: () {
                // Respond to button press

              },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 3,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                ),
              child: Text("Learn More")
            )
          ],
        ),
      ),
    );
  }
}