import 'package:dichotic/settings/types/handedness.dart';
import 'package:dichotic/settings/types/language.dart';
import 'package:drift/drift.dart';

import 'types/sex.dart';

class Preferences extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get sex => intEnum<Sex>().nullable()();
  IntColumn get handedness => intEnum<Handedness>().nullable()();
  IntColumn get age => integer().nullable()();

  TextColumn get nativeLanguage => text().map(const LanguageConverter()).nullable()();
  TextColumn get soundLanguage => text().map(const LanguageConverter()).nullable()();


}