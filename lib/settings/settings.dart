import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class SettingsPage extends StatefulWidget
{
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(L10n.of(context)!.settings)));
  }
}