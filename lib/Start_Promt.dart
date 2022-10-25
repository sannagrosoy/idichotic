import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dichotic/Start_Page.dart';

class Start_Promt extends StatefulWidget {
  const Start_Promt({super.key, required this.title});
  final String title;

  @override
  State<Start_Promt> createState() => Start_Page();
}

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    content: Stack(
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 4, 8, 24),
                          child: Text("Before you continue.."),
                        ),
                        Container(
                          //padding: EdgeInsets.fromLTRB(8, 4, 8, 24),
                          //child: Text("Please fill out the following information about yourself. This will only be stored locally to give you correct testresults until you send it in."),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(24.0),
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
                                  child: (age != null) ? Text(
                                    "Age: " + age.toString(),
                                    style: const TextStyle(
                                      fontSize: 22.0,
                                    ),
                                  ) : Text(
                                    "Age: "
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 24),
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
                                  child: (gender != 0) ? Text(
                                    "Gender: " + _genderName[gender],
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ) : Text(
                                    "Gender: "
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 24),
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
                                  child: (dominanthand != 0) ? Text(

                                    "Dominant Hand: " + _dominantHand[dominanthand],
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ) : Text(
                                    "Dominant Hand: "
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 24),
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
                                  child: (language != 0) ? Text(

                                    "Native Language: " + _nativeLanguage[language],
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ) : Text(
                                      "Native Language: "
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 24),
                                child: OutlinedButton(
                                  style:OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 3,
                                      shadowColor: Colors.black,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                                  ),
                                  child: Text("Continue>"),
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