import 'package:dichotic/Start_Page.dart';
import 'package:dichotic/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'db/database.dart';

class Start_Promt extends StatefulWidget {
  const Start_Promt({super.key, required this.title});
  final String title;

  @override
  State<Start_Promt> createState() => Start_Page();
}

final appBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,

    );

class Start_Page extends State<Start_Promt> {
  final _formKey = GlobalKey<FormState>();

  List<Widget> items = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        initItems();
      });
// your code goes here
    });
  }

  void initItems() async {
    items.add(age(context));
    items.add(sex(context));
    items.add(handedness(context));
    var nativeLang = nativeLanguage(context);
    var soundLang = soundLanguage(context);
    var sound = await soundLang;
    var native = await nativeLang;
    items.add(sound);
    items.add(native);
    var button = OutlinedButton(
      style:OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 3,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
      ),
      child: Text("Continue", style: Theme.of(context).textTheme.bodyMedium),
      onPressed: () async {
        func() => Navigator.push(context, MaterialPageRoute(builder: (context) => const StartApp(title: "Start page")));
        Preference? prefs = await database.select(database.preferences).getSingleOrNull();
        bool unset = prefs != null
                  && prefs.soundLanguage != null
                  && prefs.nativeLanguage != null
                  && prefs.age != null
                  && prefs.sex != null
                  && prefs.handedness != null;
        if (unset) {
          func();
        }
      },
    );

    items.add(button);
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          content: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              SizedBox(
                height: screenHeight*0.25,
                //height: screenHeight * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    //Padding(
                    //  padding: EdgeInsets.fromLTRB(0, screenHeight*0.02, 0, 0),
                       Text("🧠", style: Theme.of(context).textTheme.headlineLarge),
                    //Padding(
                    //  padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.03),
                       Text("iDichotic", style: Theme.of(context).textTheme.headlineLarge),
                    //Padding(
                    //  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                       Text("Before you continue..", style: Theme.of(context).textTheme.bodyMedium),
                    //Padding(
                    //  padding: EdgeInsets.fromLTRB(0, screenHeight*0.02, 0, 0),
                       Text("Please fill out the following information about yourself. This will only be stored locally to give you correct test results until you send it in.", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium)
                    ])),
              Form(
                key: _formKey,
                child: Padding(padding: EdgeInsetsDirectional.only(top:screenHeight*0.20),child:
                  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: items,
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}