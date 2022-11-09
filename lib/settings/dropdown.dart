import 'dart:developer';

import 'package:dichotic/scroll.dart';
import 'package:dichotic/settings/languages.dart';
import 'package:dichotic/settings/settings.dart';
import 'package:dichotic/settings/types/handedness.dart';
import 'package:dichotic/settings/types/sex.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import '../db/database.dart';
import '../db/shared.dart';
import 'preferences.dart';

class Dropdown<T> extends StatefulWidget {
  Dropdown({super.key,
    required this.icon,
    required this.description,
    required this.options,
  });


  static final database = constructDb();

  final Icon icon;
  final String description;
 // final List<String> options;
  final Map<String, dynamic> options;

  void updateOption() {}



  @override
  State<StatefulWidget> createState() {
    return DropdownState(icon: icon,
        description: description,
        choices: options);
  }
}
final Preferences options = Preferences();


class DropdownState extends State<Dropdown> {
  DropdownState({
    required this.icon,
    required this.description,
    required this.choices,
  });

  Icon icon;
  String description;
  ValueNotifier<int> selection = ValueNotifier(0);
  Map<String, dynamic> choices;

  T? update<T extends Enum>(String selection, T fallback, Map<String, dynamic> map) {
    T? option = fallback;
    if (map.keys.contains(selection)) {
      option = map[selection];
    }
    return option;
  }
  PreferencesCompanion updateSex(String selection) {
    Sex? sex = update(selection, Sex.unspecified, choices);
    return PreferencesCompanion(id: const Value(0), sex: Value(sex));
  }

  PreferencesCompanion updateHand(String selection) {
    Handedness? handedness = update(selection, Handedness.unspecified, choices);
    return PreferencesCompanion(id: const Value(0), handedness: Value(handedness));
  }

  Future<PreferencesCompanion> updateSoundLanguage(String selection) async {
    var result = await Languages.get(context);
    if (!soundLanguages.contains(result[selection]!.iso_639_2)) {
      log("Somehow received an undefined sound language as input");
      return const PreferencesCompanion(id: Value(0));
    }
    return PreferencesCompanion(id: const Value(0), soundLanguage: Value(result[selection]));
  }

  Future<PreferencesCompanion> updateNativeLanguage(String selection) async {
    var result = await Languages.get(context);
    return PreferencesCompanion(id: const Value(0), nativeLanguage: Value(result[selection]));
  }

  PreferencesCompanion updateAge(String selection) {
    var result = int.tryParse(selection);
    return PreferencesCompanion(id: const Value(0), age: Value(result));
  }


  void updateFields(String option, String selection) async {
    Map values = {
      L10n.of(context)!.sex: updateSex,
      L10n.of(context)!.handedness: updateHand,
      L10n.of(context)!.nativeLanguage: updateNativeLanguage,
      L10n.of(context)!.soundLanguage: updateSoundLanguage,
      L10n.of(context)!.age: updateAge
    };
    if (values.containsKey(option)) {
      // Call the method matching option that was changed
      updateWithCompanion(await values[option].call(selection));
    }
    else {
      log("Attempted to update unrecognized field");
    }
  }

  void updateWithCompanion(PreferencesCompanion companion) async {
    await Dropdown.database
      .into(Dropdown.database.preferences)
      .insertOnConflictUpdate(companion);
  }


  Widget picker(String option){
    return CupertinoPageScaffold(
      child: ScrollConfiguration(
        behavior: CrossPlatformScrollBehaviour(),
        child:
          CupertinoPicker(
            itemExtent: 20,
            onSelectedItemChanged: (int selection) {
              setState(() {
                this.selection.value = selection;
                updateFields(option, choices.keys.toList()[selection]);
              });
            },
            scrollController: FixedExtentScrollController(),
            //children: [sex(context), language(context)],
            children: List<Widget>.generate(choices.length, (index) {
              return Center(child: Text(choices.keys.toList()[index]));
            })
          )
      )
    );
  }

  void showPicker(Widget child) {
    showCupertinoModalPopup(context: context, builder:
      (BuildContext context) => Container(
        height: 200,
        padding: const EdgeInsets.only(top: 0.0),
        child: SafeArea(top: false, child: child),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.bottomCenter,
      child: FittedBox(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(description),
          ValueListenableBuilder<int>(
            builder: (BuildContext context, int value, Widget? child) {
              return CupertinoButton(
                  child: Text(choices.keys.toList()[value]),
                  onPressed: () => showPicker(picker(description)));
            },
            valueListenable: selection,
          )
        ],
      ),
      )
    );
  }
}