import 'dart:convert';

import 'package:dichotic/settings/types/language.dart';
import 'package:flutter/cupertino.dart';

class Languages {
  static final Map<String, Language> _items = {};

  static Future<void> load(BuildContext context) async {
    String string = await DefaultAssetBundle.of(context).loadString("assets/languages.txt");
    const LineSplitter().convert(string).forEach((element) {
      var elements = element.split('|');
      var lang = Language(
          iso_639_2: elements[0],
          iso_639_1: elements[1],
          english:   elements[3],
          french:    elements[4],
      );
      _items[elements[3]] = lang;
    });
  }

  static Future<Map<String, Language>> get(BuildContext context) async {
    if (_items.isEmpty) {
      await load(context);
    }
    return _items;
  }
}