// SPDX-FileCopyrightText: 2022 iDichotic+ Authors <https://dichotic.app>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:dichotic/Start_Page.dart';
import 'package:dichotic/settings/settings.dart';
import 'package:dichotic/settings/types/handedness.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'db/database.dart';
import 'settings/types/sex.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    items.add(age(context));
    items.add(sex(context));
    items.add(handedness(context));
    var nativeLang = nativeLanguage(context);
    var soundLang = soundLanguage(context);
    var sound = await soundLang;
    var native = await nativeLang;
    items.add(sound);
    items.add(native);
    var button = Container(
      width: screenWidth*0.7,
      height: screenHeight*0.06,
      child: OutlinedButton(
      style:OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 3,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
      ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Continue", style: Theme.of(context).textTheme.bodyMedium), Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black)]),
      onPressed: () async {
        continueIfFilled();
      },
    ));

    items.add(button);
  }
  int warned = 0;

  void continueIfFilled() async {
    func() => Navigator.push(context, MaterialPageRoute(
        builder: (context) => const StartApp(title: "Start page")));
    Preference? prefs = await database.select(database.preferences)
        .getSingleOrNull();
    bool unset = prefs != null
        && prefs.soundLanguage != null
        && prefs.sex != null
        && prefs.handedness != null;

    if (unset) {
      if (warned == 0 &&
          (prefs.nativeLanguage == null
              || prefs.sex == Sex.unspecified
              || prefs.age == null
              || prefs.handedness == Handedness.unspecified)) {
        Widget ok = ElevatedButton(
          child: Text(L10n.of(context)!.dismiss),
          onPressed: () {
            Navigator.of(context).pop();
            warned++;
          },
        );
        // show the alert dialog
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Warning", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,),
                alignment: Alignment.center,
                actionsAlignment: MainAxisAlignment.center,
                content: Column(mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Text("${L10n.of(context)!.missingOption}\n", style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                      Text(L10n.of(context)!.canContinue, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
                ]),
                actions: [
                  ok,
                ],
                elevation: 5,
              );
            });
        return;
      }
      func();
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromARGB(196, 235, 235, 235),
        padding: EdgeInsets.fromLTRB(3, 65, 3, 65),
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          content: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              SizedBox(
                height: screenHeight*0.28,
                //height: screenHeight * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Padding(
                    padding: EdgeInsets.only(top: screenHeight*0.02),
                       child: Icon(Icons.headphones_outlined, size: 60)),
                    //Padding(
                    //  padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight*0.03),
                       Text("iDichotic", style: Theme.of(context).textTheme.headlineLarge),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight*0.02),
                       child: Text("Before you continue..", style: Theme.of(context).textTheme.bodyLarge)),
                    //Padding(
                    //  padding: EdgeInsets.fromLTRB(0, screenHeight*0.02, 0, 0),
                       Text("Please fill out the following information about yourself. This will only be stored locally to give you correct test results until you send it in.", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium)
                    ])),
              Form(
                key: _formKey,
                child: Padding(padding: EdgeInsets.only(top:screenHeight*0.35),
                child:
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