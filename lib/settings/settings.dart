import 'package:dichotic/settings/dropdown.dart';
import 'package:dichotic/settings/languages.dart';
import 'package:dichotic/settings/types/handedness.dart';
import 'package:dichotic/settings/types/sex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class SettingsPage extends StatefulWidget
{
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingsState();
}

final soundLanguages = ["eng", "nor", "est", "fin", "ger"];

var icons = [Icons.abc, Icons.label, Icons.g_mobiledata, Icons.offline_bolt, Icons.face, Icons.sailing_rounded];

class SettingsState extends State<SettingsPage> {
  final List<Expanded> items = [];
  @override
  void initState() {
    super.initState();
    initItems();
  }

  void initItems() async {
    var sound = soundLanguage(context);
    var lang = await nativeLanguage(context);
    var soundLang = await sound;
    setState(() {
      items.add(sex(context));
      items.add(handedness(context));
      items.add(age(context));
      items.add(lang);
      items.add(soundLang);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context)!.settings)),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items
            //children: List<Widget>.generate(6, (index) =>
            //    Expanded(child:
            //    FittedBox(child: Dropdown(
            //      icon: Icon(icons[index]),
            //      description: icons[index].toString(),
            //      options: icons.map((e) => e.toString()).toList())))),
            //)
           )
        )
    );
  }
}

Future<Expanded> soundLanguage(context) async {
  Map<String, dynamic> map = Map.from(await Languages.get(context));

  map.removeWhere((key, value) => !soundLanguages.contains(value.iso_639_2));
  return Expanded(child:
    FittedBox(child:
      Dropdown(
        icon: const Icon(Icons.sign_language),
        description: L10n.of(context)!.soundLanguage,
        options: map
      )
  ));
}

Future<Expanded> nativeLanguage(context) async {
  var map = await Languages.get(context);

  return Expanded(child:
    FittedBox(child:
      Dropdown(
        icon: const Icon(Icons.language),
        description: L10n.of(context)!.nativeLanguage,
        options: map
      )
  ));
}

Expanded sex(context) {
  var map = {
     L10n.of(context)!.male: Sex.male,
     L10n.of(context)!.female: Sex.female,
     L10n.of(context)!.otherSex: Sex.other,
     L10n.of(context)!.unspecified: Sex.unspecified,
  };
  return Expanded(child:
    FittedBox(child:
      Dropdown(
      icon: const Icon(Icons.transgender),
      description: L10n.of(context)!.sex,
      options: map
    )
  ));
}

Expanded handedness(context) {
  var map = {
    L10n.of(context)!.right: Handedness.right,
    L10n.of(context)!.left: Handedness.left,
    L10n.of(context)!.both: Handedness.both,
    L10n.of(context)!.unspecified: Handedness.unspecified
  };
  return Expanded(child:
    FittedBox(child:
      Dropdown(
        icon: const Icon(Icons.handshake),
        description: L10n.of(context)!.handedness,
        options: map
    )));
}

Expanded age(context) {
  var ages = List.generate(100, (index) => index.toString()).toList();
  Map<String, dynamic> map = {};
  for (var element in ages) { map[element] = null; }

  return Expanded(child:
    FittedBox(child:
      Dropdown(
        icon: const Icon(Icons.timelapse),
        description: L10n.of(context)!.age,
        options: map)
    )
  );
}