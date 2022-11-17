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
            Text(
                "Well done! You had more correct answers from the right ear. This indicates that language is processed mainly in the left part of your brain, please help our research by submitting your result in the top right corner."
            ),
            ResultsChart(data)
          ],
        )
    ),

    Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: const
            Text(
                "The beginnings of the dichotic listening technique can be traced back to the 1950s and Donald Broadbent, who was interested in testing auditory attention abilities in air traffic controllers. About 10 years later, Doreen Kimura (1961a, 1961b) modified the paradigm and used spoken digits, which were presented simultaneously via headphones, one to each ear, to investigate language lateralization in patients with epilepsy and healthy subjects. The results showed that in both cases subjects with left hemisphere language processing recalled more items from the right ear, yielding what is called the right ear advantage. Subjects with language functions lateralized to the right hemisphere showed a tendency to report items presented to the left ear, yielding a left ear advantage. These findings have been replicated by numerous scientific studies (Hugdahl, 2003; Bryden, 1988). More recently, Kenneth Hugdahl and colleagues have developed a consonant-vowel version of the dichotic listening paradigm (Hugdahl & Andersson, 1986), which is the basis of this iDichotic App. There are a few theoretical models that attempt to explain the common bias to report the right ear stimulus. The most widely accepted one goes back to Kimura (1967) and is called the structural model. It is based on the observation that each ear is predominantly connected to the opposite (contralateral) side of the brain (see Rosenzweig, 1951). As a result, the stimulus played to the right ear will be more strongly represented in the contralateral left hemisphere, which in most individuals is the hemisphere which processes speech and language (Tervaniemi & Hugdahl, 2003; Frost el al., 1999; Loring et al., 1990). However, stimuli presented to the left ear will first be transferred to the right hemisphere. Since the right hemisphere is not able to fully process speech, the incoming information needs to be transferred to the left hemisphere in order to get processed. The resulting in a delayed processing of the left-ear as compared to the right-ear stimulus is thought to explain the right-ear preference in dichotic listening. References: Broadbent, D. E. (1954). The role of auditory localization in attention and memory span. Journal of experimental psychology, 47(3), 191-196. Bryden, M. P. (1988). An overview of the dichotic listening procedure and its relation to cerebral organization. In K. Hugdahl (Ed.), Handbook of dichotic listening: Theory, methods and research (pp.1-43). Chichester, England: Wiley. Frost, J. A., Binder, J. R., Springer, J. A., Hammeke, T. A., Bellgowan, P. S., Rao, S. M., & Cox, R.W. (1999). Language processing is strongly left lateralized in both sexes. Evidence from functional MRI. Brain, 122(2), 199-208. Hugdahl, K., & Andersson, L. (1986). The \"forced-attention paradigm\" in dichotic listening to CV-syllables: a comparison between adults and children. Cortex, 22(3), 417-432. Hugdahl, K. (2003). Dichotic listening in the study of auditory laterality. In K. Hugdahl & R. J. Davidson (Eds.), The asymmetrical brain. Cambridge, Mass.: MIT Press. Kimura, D. (1961a). Cerebral dominance and the perception of verbal stimuli. Canadian journal of psychology, 15(3), 166-171. Kimura, D. (1961b). Some effects of temporal-lobe damage on auditory perception. Canadian journal of psychology, 15, 156-165. Loring, D. W., Meador, K. J., Lee, G. P., Murro, A. M., Smith, J. R., Flanigin, H. F., Gallagher, B. B., & King, D. W. (1990). Cerebral language lateralization: evidence from intracarotid amobarbital testing. Neuropsychologia, 28(8), 831-838. Rosenzweig, M. R. (1951). Representations of the two ears at the auditory cortex. American journal of physiology, 167(1), 147. Tervaniemi, M. & Hugdahl, K. (2003). Lateralization of auditory-cortex functions. Brain Research Reviews, 43, 231-246.",
            ),

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
    return Scaffold(
      //extendBodyBehindAppBar: true,

      appBar: AppBar(
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
                    content: Text("You can contribute to our research by submitting your results to our global dichotic listening databas The transfer of your test results to our database is optional and depends on your consent. The size of the files is very small (< 2kb). Most importantly, the transferred file is completely anonymous. We use a secure file transfer protocol and password protected data storage on a university-owned server. The file cannot be traced to a particular iPhone ID. It includes the settings and test scores. We reserve the rights to use this information for statistical analyses and scientific publications. The average statistics of results received by us can be viewed at www.dichoticlistening.com.\n\nYou can read more about us at http://fmri.uib.no"),
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
              icon: Icon(Icons.bar_chart),
              label: 'Main Results'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Details'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined),
              label: 'Animation'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),


    );
  }

}