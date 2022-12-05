// SPDX-FileCopyrightText: 2022 iDichotic+ Authors <https://dichotic.app>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      iso_639_1: json['iso_639_1'] as String?,
      iso_639_2: json['iso_639_2'] as String,
      english: json['english'] as String,
      french: json['french'] as String,
      german: json['german'] as String?,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'iso_639_1': instance.iso_639_1,
      'iso_639_2': instance.iso_639_2,
      'english': instance.english,
      'french': instance.french,
      'german': instance.german,
    };
