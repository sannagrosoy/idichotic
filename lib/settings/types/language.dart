// SPDX-FileCopyrightText: 2022 iDichotic+ Authors <https://dichotic.app>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class Language {
  const Language({
    this.iso_639_1,
    required this.iso_639_2,
    required this.english,
    required this.french,
    this.german
  });

  final String? iso_639_1;
  final String iso_639_2;

  final String english;
  final String french;
  final String? german;

  @override
  bool operator == (Object other) {
    if (other is Language) {
      return other.iso_639_2 == iso_639_2;
    }
    return false;
  }

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  @override
  int get hashCode => iso_639_2.hashCode;

}

// Stores languages as strings in the database
class LanguageConverter extends TypeConverter<Language, String> {
  const LanguageConverter();

  @override
  Language fromSql(String fromDb) {
    return Language.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(Language value) {
    return json.encode(value.toJson());
  }
}