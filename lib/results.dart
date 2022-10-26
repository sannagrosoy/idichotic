import 'package:flutter/material.dart';
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
  const Results({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Results> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Results> {


  static final List<Widget> _pages = <Widget> [
    Center(
        child: Column(
          children: const [
            Icon(
              Icons.construction,
              size: 150,
            ),
            Text(
                "Well done!\nSomething something your brain left right"
            ),
            /*PieChart(
              //har vist nok en license, bare brukt som eksempel
                dataMap:
                {
                  "LEFT": 50,
                  "RIGHT": 30,
                  "UNSPECIFIED": 20,
                }
            ),*/
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
                "Why do we know this?????????????????????????????????"
            ),
          ],
        )
    ),




    Center(

        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                //flex: 2,
                child:Column(
                  children: [
                    Expanded(
                        child: Icon(
                          Icons.construction,
                        )),Expanded(
                      child: Icon(
                        Icons.construction,
                      ),),Expanded(
                      child: Icon(
                        Icons.construction,
                      ),),
                  ],
                ),),
              Expanded(
                //flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.construction,
                        ),),
                      Expanded(
                        child: Icon(
                          Icons.construction,
                        ),),
                      Expanded(
                        child: Icon(
                          Icons.construction,
                        ),),

                    ],
                  ))
            ]
        )
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
                    content: Text("Something Something Something Something Something Something Something Something TOS Data"),
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