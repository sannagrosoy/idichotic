import 'package:dichotic/exampledata.dart';
import 'package:dichotic/resultschart.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:charts_flutter/flutter.dart' as charts;
/*
class Results extends StatelessWidget {
  const Results({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

      ),
      home: const MyHomePage(title: 'Results'),
    );
  }
}*/

class Results extends StatefulWidget {
  Results({super.key, required this.title});

  final List<ExampleData> data = [
    ExampleData(
        amount: 10,
        n: 1,
        id: "Right",
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ExampleData(
        amount: 10,
        n: 2,
        id: "Left",
        barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ExampleData(
        amount: 10,
        n:3,
        id: "Error",
        barColor: charts.ColorUtil.fromDartColor(Colors.red),
    )
  ];

  final String title;

  @override
  State<Results> createState() => _MyHomePageState();
}

class VideoPlayerExample extends StatefulWidget{
  const VideoPlayerExample({super.key});
  @override
  State<StatefulWidget> createState() => _VideoPlayerScreenState();

}
class _VideoPlayerScreenState extends State{
  late VideoPlayerController _videoPlayerController;
  //late Future<void> _initVideoPlayerFuture;

  void initState(){
    super.initState();
    _videoPlayerController = VideoPlayerController.asset("assets/video/NL.mp4");
    //_initVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.initialize().then((_) {setState(() {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
  });

  }


  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _videoPlayerController.value.isInitialized ? AspectRatio(aspectRatio:
      _videoPlayerController.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController)
      ): Container()
    );
  }

}

class _MyHomePageState extends State<Results> {

  static final List<ExampleData> data = [
    ExampleData(
      amount: 23,
      n: 1,
      id: "Right",
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ExampleData(
      amount: 4,
      n: 2,
      id: "Left",
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ExampleData(
      amount: 3,
      n:3,
      id: "Error",
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    )
  ];

  static final List<Widget> _pages = <Widget> [
    Center(
        child: Column(
          children: [
            Icon(
              Icons.construction,
              size: 150,
            ),
            Text(
                "Well done!\nSomething something your brain left right"
            ),
            ResultsChart(data)
          ],
        )
    ),

    Center(
        child: Column(
          children: const [
            Icon(
              Icons.construction,
              size: 150,
            ),
            Text(
                "Why do we know this? Your brain something something, signal travels across brain"
            ),
          ],
        )
    ),




    Center(
        child: VideoPlayerExample(),
    )];

  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //extendBodyBehindAppBar: true,

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(context);
              },
            icon: const Icon(Icons.arrow_back_ios)
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Submit Results"),
                    content: Text("Something Something privacy Something Something lawsuit Something Something Something Something TOS Data"),
                    actions: [
                      TextButton(
                        onPressed: (){},
                        child: const Text("Submit"),
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text("Back")
                      )
                    ],

                  ),
                );
              },
              child: const Text("Submit data"))
        ],
      ),
      body: Center(
        heightFactor: Checkbox.width,
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.transparent,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),


    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

}