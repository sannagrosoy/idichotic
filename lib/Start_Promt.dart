import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dichotic/Start_Page.dart';

class Start_Promt extends StatefulWidget {
  const Start_Promt({super.key, required this.title});
  final String title;

  @override
  State<Start_Promt> createState() => Start_Page();
}

final appBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );

class Start_Page extends State<Start_Promt> {
  final _formKey = GlobalKey<FormState>();
  int? age = null;
  final List<String> _genderName = <String>[
    "None",
    "Other",
    "Male",
    "Female"
  ];
  int gender = 0;
  final List<String> _dominantHand = <String>[
    "None",
    "Left",
    "Right",
    "Both"
  ];
  int dominanthand = 0;
  final List<String> _nativeLanguage = <String>[
    "None",
    "English",
    "German",
    "French",
    "Polish",
    "Norwegian",
    "Swedish",
    "Danish",
    "Italian",
    "Arabic",
    "Finish"
  ];
  int language = 0;
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        child: AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    content: Stack(
                      children: <Widget>[
                        Container(
                          height: screenHeight * 0.5,
                          child: Column( 
                            children: <Widget> [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, screenHeight*0.02, 0, 0),
                                child: Text("🧠", style: TextStyle(fontSize: 85))),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.03),
                                child: Text("iDichotic", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text("Before you continue..", style: TextStyle(fontSize: 18))),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, screenHeight*0.02, 0, 0),
                                child: Text("Please fill out the following information about yourself. This will only be stored locally to give you correct test results until you send it in.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16)))
                              ])),
                        Container(
                          //padding: EdgeInsets.fromLTRB(8, 4, 8, 24),
                          //child: Text("Please fill out the following information about yourself. This will only be stored locally to give you correct testresults until you send it in."),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () => _showDialog(
                                    CupertinoPicker(
                                      magnification: 1.22,
                                      squeeze: 1.2,
                                      useMagnifier: true,
                                      itemExtent: 32.0,
                                      onSelectedItemChanged: (int selectedItem) {
                                        setState(() {
                                          age = selectedItem + 13;
                                        });
                                      },
                                      children:
                                      List<Widget>.generate(100-13, (int index) {
                                        return Center(
                                          child: Text(
                                            (index + 13).toString(),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  // This displays the selected fruit name.
                                  child: (age != null) ? 
                                  Container(
                                  width: screenWidth*0.65,
                                  child: Row(
                                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget> [
                                      Container(
                                        width: screenWidth * 0.4,
                                        child: Text("Age", style: TextStyle(fontSize: 16, color: Colors.black))), 
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        width: screenWidth * 0.25,
                                        child: Text(age.toString(), textAlign:TextAlign.right, style: TextStyle(fontSize: 16, color: Colors.black)))]
                                    //"Age: " + age.toString(),
                                    //style: const TextStyle(
                                    //  fontSize: 18.0
                                    //),
                                  )) :
                                  Container(
                                  width: screenWidth*0.65,
                                  child: Row(
                                      children: <Widget> [
                                      Container(
                                        width: screenWidth * 0.4,
                                        child: Text("Age", style: TextStyle(fontSize: 16, color: Colors.black))),  
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        width: screenWidth * 0.25,
                                        child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16))
                                      ]
                                    //children: <Widget> [Text("Age", style: TextStyle(fontSize: 16, color: Colors.black)), Container(width: screenWidth * 0.463), Icon(Icons.arrow_forward_ios, color: Colors.black)]
                                  )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  // Display a CupertinoPicker with list of fruits.
                                  onPressed: () => _showDialog(
                                    CupertinoPicker(
                                      magnification: 1.22,
                                      squeeze: 1.2,
                                      useMagnifier: true,
                                      itemExtent: 32.0,
                                      // This is called when selected item is changed.
                                      onSelectedItemChanged: (int selectedItem) {
                                        setState(() {
                                          gender = selectedItem;
                                        });
                                      },
                                      children:
                                      List<Widget>.generate(_genderName.length, (int index) {
                                        return Center(
                                          child: Text(
                                            _genderName[index],
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  // This displays the selected fruit name.
                                  child: (gender != 0) ? 
                                  Container(
                                  width: screenWidth*0.65,
                                  child: Row(
                                    children: <Widget> [
                                      Container(
                                        width: screenWidth * 0.4,
                                        child: Text("Gender", style: TextStyle(fontSize: 16, color: Colors.black))), 
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        width: screenWidth * 0.25,
                                        child: Text(_genderName[gender], textAlign:TextAlign.right, style: TextStyle(fontSize: 16, color: Colors.black)))]
                                    //"Gender: " + _genderName[gender],
                                    //style: const TextStyle(
                                      //fontSize: 18.0,
                                    //),
                                  )) : 
                                  Container(
                                  width: screenWidth*0.65,
                                  child: Row(
                                    children: <Widget> [
                                      Container(
                                        width: screenWidth * 0.4,
                                        child: Text("Gender", style: TextStyle(fontSize: 16, color: Colors.black))), 
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        width: screenWidth * 0.25,
                                        child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16))
                                      ]
                                  )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () => _showDialog(
                                    CupertinoPicker(
                                      magnification: 1.22,
                                      squeeze: 1.2,
                                      useMagnifier: true,
                                      itemExtent: 32.0,
                                      // This is called when selected item is changed.
                                      onSelectedItemChanged: (int selectedItem) {
                                        setState(() {
                                          dominanthand = selectedItem;
                                        });
                                      },
                                      children:
                                      List<Widget>.generate(_dominantHand.length, (int index) {
                                        return Center(
                                          child: Text(
                                            _dominantHand[index],
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  // This displays the selected fruit name.
                                  child: (dominanthand != 0) ?                                   
                                  Container(
                                  width: screenWidth*0.65,
                                  child: Row(
                                    children: <Widget> [
                                      Container(
                                        width: screenWidth * 0.4,
                                        child: Text("Dominant Hand", style: TextStyle(fontSize: 16, color: Colors.black))), 
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        width: screenWidth * 0.25,
                                        child: Text(_dominantHand[dominanthand], textAlign:TextAlign.right, style: TextStyle(fontSize: 16, color: Colors.black)))]
                                    //"Dominant Hand: " + _dominantHand[dominanthand],
                                    //style: const TextStyle(
                                      //fontSize: 18.0,
                                    //),
                                  )):Container(
                                  width: screenWidth*0.65,
                                  child: Row(
                                    children: <Widget> [
                                      Container(
                                        width: screenWidth * 0.4,
                                        child: Text("Dominant Hand", style: TextStyle(fontSize: 16, color: Colors.black))), 
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        width: screenWidth * 0.25,
                                        child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16))
                                      ]
                                  )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child: CupertinoButton(
                                  
                                  padding: EdgeInsets.zero,
                                  // Display a CupertinoPicker with list of fruits.
                                  onPressed: () => _showDialog(
                                    CupertinoPicker(
                                      magnification: 1.22,
                                      squeeze: 1.2,
                                      useMagnifier: true,
                                      itemExtent: 32.0,
                                      // This is called when selected item is changed.
                                      onSelectedItemChanged: (int selectedItem) {
                                        setState(() {
                                          language = selectedItem;
                                        });
                                      },
                                      children:
                                      List<Widget>.generate(_nativeLanguage.length, (int index) {
                                        return Center(
                                          child: Text(
                                            _nativeLanguage[index],
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  // This displays the selected fruit name.
                                  child: (language != 0) ? 
                                  Container(
                                  width: screenWidth*0.65,
                                  child: Row(
                                    children: <Widget> [
                                      Container(
                                        width: screenWidth*0.4,
                                        alignment: Alignment.bottomLeft,
                                        child: Text("Native Language", style: TextStyle(fontSize: 16, color: Colors.black))), 
                                      Container(
                                        width: screenWidth*0.25,
                                        alignment: Alignment.bottomRight,
                                        child: Text(_nativeLanguage[language], textAlign:TextAlign.right, style: TextStyle(fontSize: 16, color: Colors.black)))]
                                    //"Native Language: " + _nativeLanguage[language],
                                    //style: const TextStyle(
                                    //  fontSize: 18.0,
                                    //),
                                  )) : Container(
                                    width: screenWidth*0.65,
                                    child: Row(
                                    children: <Widget> [
                                      Container(
                                        width: screenWidth*0.4,
                                        alignment: Alignment.bottomLeft,
                                        child: Text("Native Language", style: TextStyle(fontSize: 16, color: Colors.black))), 
                                      Container(
                                        width: screenWidth*0.25,
                                        alignment: Alignment.bottomRight,
                                        child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16))
                                      ]
                                    )
                                  ),
                                ),
                              ),
                              Container(
                                //height: ,
                                child: OutlinedButton(
                                  style:OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 3,
                                      shadowColor: Colors.black,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                                  ),
                                  child: Text("Continue", style: TextStyle(color: Colors.black)),
                                  onPressed: () {
                                    (age != null && gender != 0 && dominanthand != 0 && language != 0) ? Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const StartApp(title: "Start Page"))
                                    ) : null ;
                                    //if (_formKey.currentState.validate()) {
                                      //_formKey.currentState.save();
                                    //}
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              )
      );
  }
}