import 'package:dichotic/scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key,
    required this.icon,
    required this.description,
    required this.options
  });

  final Icon icon;
  final String description;
  final List<String> options;

  void updateOption() {}


  @override
  State<StatefulWidget> createState() {
    return DropdownState(icon: icon,
        description: description,
        options: options);
  }
}

class DropdownState extends State<Dropdown> {
  DropdownState({
    required this.icon,
    required this.description,
    required this.options,
  });

  Icon icon;
  String description;
  ValueNotifier<int> selection = ValueNotifier(0);
  List<String> options;

  Widget picker(List<String> items){
    return CupertinoPageScaffold(
      //behavior: ScrollBehavior().copyWith(platform: TargetPlatform.linux ),
      //behavior: CupertinoScrollBehavior(),
      child: ScrollConfiguration(
        behavior: CrossPlatformScrollBehaviour(),
        child:
          CupertinoPicker(
            itemExtent: 20,
            onSelectedItemChanged: (int selection) {
              setState(() {
                this.selection.value = selection;
              });
            },
            scrollController: FixedExtentScrollController(),
            children: List<Widget>.generate(options.length, (index) {
              return Center(child: Text(options[index]));
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(description),
            Spacer(flex: 1),
            ValueListenableBuilder<int>(
              builder: (BuildContext context, int value, Widget? child) {
                return CupertinoButton(
                    child: Text(options[value]),
                    onPressed: () => showPicker(picker(options)));
              },
              valueListenable: selection,
            )
          ],
        ),
      );
  }
}