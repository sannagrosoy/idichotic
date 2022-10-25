import 'package:dichotic/settings/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class SettingsPage extends StatefulWidget
{
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingsState();
}

var icons = [Icons.abc, Icons.label, Icons.g_mobiledata, Icons.offline_bolt, Icons.face, Icons.sailing_rounded];

class SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context)!.settings)),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(6, (index) =>
                Dropdown(
                  icon: Icon(icons[index]),
                  description: icons[index].toString(),
                  options: icons.map((e) => e.toString()).toList()))),
        )
    );
  }
}