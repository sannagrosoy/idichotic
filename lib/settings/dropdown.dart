import 'package:dichotic/scroll.dart';
import 'package:dichotic/settings/types/sex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:isar/isar.dart';

import 'options.dart';

class Dropdown extends StatefulWidget {
  Dropdown({super.key,
    required this.icon,
    required this.description,
    required this.options,
  });


  static final isar = Isar.openSync([OptionsSchema]);

  final Icon icon;
  final String description;
  final List<String> options;

  void updateOption() {}



  @override
  State<StatefulWidget> createState() {
    return DropdownState(icon: icon,
        description: description,
        choices: options);
  }
}
final Options options = Options();


class DropdownState extends State<Dropdown> {
  DropdownState({
    required this.icon,
    required this.description,
    required this.choices,
  });

  Icon icon;
  String description;
  ValueNotifier<int> selection = ValueNotifier(0);
  List<String> choices;

  void updateSex(String selection) {
    if (selection == L10n.of(context)!.male) {
      options.sex = Sex.male;
    }
    if (selection == L10n.of(context)!.female) {
      options.sex = Sex.female;
    }
    if (selection == L10n.of(context)!.otherSex) {
      options.sex = Sex.other;
    }
  }

  void updateHand(String selection) {

  }

  void updateLanguage(String selection) {

  }

  void updateAge(String selection) {

  }

  void updateFields(String option, String selection) async {
    Map values = {
      L10n.of(context)!.sex: updateSex,
      L10n.of(context)!.dominantHand: updateHand,
      L10n.of(context)!.language: updateLanguage,
      L10n.of(context)!.age: updateAge
    };
    if (values.containsKey(option)) {
      // Call the method matching option that was changed
      values[option].call(selection);
      await Dropdown.isar.writeTxn(() => Dropdown.isar.options.put(options));
    }
  }

  Widget picker(List<String> items, String option){
    return CupertinoPageScaffold(
      child: ScrollConfiguration(
        behavior: CrossPlatformScrollBehaviour(),
        child:
          CupertinoPicker(
            itemExtent: 20,
            onSelectedItemChanged: (int selection) {
              setState(() {
                this.selection.value = selection;
                updateFields(option, choices[selection]);
              });
            },
            scrollController: FixedExtentScrollController(),
            //children: [sex(context), language(context)],
            children: List<Widget>.generate(choices.length, (index) {
              return Center(child: Text(choices[index]));
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
            //Spacer(flex: 1),
            ValueListenableBuilder<int>(
              builder: (BuildContext context, int value, Widget? child) {
                return CupertinoButton(
                    child: Text(choices[value]),
                    onPressed: () => showPicker(picker(choices, description)));
              },
              valueListenable: selection,
            )
          ],
        ),
        )
      );
  }
}