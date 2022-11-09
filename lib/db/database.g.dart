// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Preference extends DataClass implements Insertable<Preference> {
  final int id;
  final Sex? sex;
  final Handedness? handedness;
  final int? age;
  final Language? nativeLanguage;
  final Language? soundLanguage;
  const Preference(
      {required this.id,
      this.sex,
      this.handedness,
      this.age,
      this.nativeLanguage,
      this.soundLanguage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || sex != null) {
      final converter = $PreferencesTable.$converter0n;
      map['sex'] = Variable<int>(converter.toSql(sex));
    }
    if (!nullToAbsent || handedness != null) {
      final converter = $PreferencesTable.$converter1n;
      map['handedness'] = Variable<int>(converter.toSql(handedness));
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || nativeLanguage != null) {
      final converter = $PreferencesTable.$converter2n;
      map['native_language'] =
          Variable<String>(converter.toSql(nativeLanguage));
    }
    if (!nullToAbsent || soundLanguage != null) {
      final converter = $PreferencesTable.$converter3n;
      map['sound_language'] = Variable<String>(converter.toSql(soundLanguage));
    }
    return map;
  }

  PreferencesCompanion toCompanion(bool nullToAbsent) {
    return PreferencesCompanion(
      id: Value(id),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      handedness: handedness == null && nullToAbsent
          ? const Value.absent()
          : Value(handedness),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      nativeLanguage: nativeLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(nativeLanguage),
      soundLanguage: soundLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(soundLanguage),
    );
  }

  factory Preference.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Preference(
      id: serializer.fromJson<int>(json['id']),
      sex: serializer.fromJson<Sex?>(json['sex']),
      handedness: serializer.fromJson<Handedness?>(json['handedness']),
      age: serializer.fromJson<int?>(json['age']),
      nativeLanguage: serializer.fromJson<Language?>(json['nativeLanguage']),
      soundLanguage: serializer.fromJson<Language?>(json['soundLanguage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sex': serializer.toJson<Sex?>(sex),
      'handedness': serializer.toJson<Handedness?>(handedness),
      'age': serializer.toJson<int?>(age),
      'nativeLanguage': serializer.toJson<Language?>(nativeLanguage),
      'soundLanguage': serializer.toJson<Language?>(soundLanguage),
    };
  }

  Preference copyWith(
          {int? id,
          Value<Sex?> sex = const Value.absent(),
          Value<Handedness?> handedness = const Value.absent(),
          Value<int?> age = const Value.absent(),
          Value<Language?> nativeLanguage = const Value.absent(),
          Value<Language?> soundLanguage = const Value.absent()}) =>
      Preference(
        id: id ?? this.id,
        sex: sex.present ? sex.value : this.sex,
        handedness: handedness.present ? handedness.value : this.handedness,
        age: age.present ? age.value : this.age,
        nativeLanguage:
            nativeLanguage.present ? nativeLanguage.value : this.nativeLanguage,
        soundLanguage:
            soundLanguage.present ? soundLanguage.value : this.soundLanguage,
      );
  @override
  String toString() {
    return (StringBuffer('Preference(')
          ..write('id: $id, ')
          ..write('sex: $sex, ')
          ..write('handedness: $handedness, ')
          ..write('age: $age, ')
          ..write('nativeLanguage: $nativeLanguage, ')
          ..write('soundLanguage: $soundLanguage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sex, handedness, age, nativeLanguage, soundLanguage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Preference &&
          other.id == this.id &&
          other.sex == this.sex &&
          other.handedness == this.handedness &&
          other.age == this.age &&
          other.nativeLanguage == this.nativeLanguage &&
          other.soundLanguage == this.soundLanguage);
}

class PreferencesCompanion extends UpdateCompanion<Preference> {
  final Value<int> id;
  final Value<Sex?> sex;
  final Value<Handedness?> handedness;
  final Value<int?> age;
  final Value<Language?> nativeLanguage;
  final Value<Language?> soundLanguage;
  const PreferencesCompanion({
    this.id = const Value.absent(),
    this.sex = const Value.absent(),
    this.handedness = const Value.absent(),
    this.age = const Value.absent(),
    this.nativeLanguage = const Value.absent(),
    this.soundLanguage = const Value.absent(),
  });
  PreferencesCompanion.insert({
    this.id = const Value.absent(),
    this.sex = const Value.absent(),
    this.handedness = const Value.absent(),
    this.age = const Value.absent(),
    this.nativeLanguage = const Value.absent(),
    this.soundLanguage = const Value.absent(),
  });
  static Insertable<Preference> custom({
    Expression<int>? id,
    Expression<int>? sex,
    Expression<int>? handedness,
    Expression<int>? age,
    Expression<String>? nativeLanguage,
    Expression<String>? soundLanguage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sex != null) 'sex': sex,
      if (handedness != null) 'handedness': handedness,
      if (age != null) 'age': age,
      if (nativeLanguage != null) 'native_language': nativeLanguage,
      if (soundLanguage != null) 'sound_language': soundLanguage,
    });
  }

  PreferencesCompanion copyWith(
      {Value<int>? id,
      Value<Sex?>? sex,
      Value<Handedness?>? handedness,
      Value<int?>? age,
      Value<Language?>? nativeLanguage,
      Value<Language?>? soundLanguage}) {
    return PreferencesCompanion(
      id: id ?? this.id,
      sex: sex ?? this.sex,
      handedness: handedness ?? this.handedness,
      age: age ?? this.age,
      nativeLanguage: nativeLanguage ?? this.nativeLanguage,
      soundLanguage: soundLanguage ?? this.soundLanguage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sex.present) {
      final converter = $PreferencesTable.$converter0n;
      map['sex'] = Variable<int>(converter.toSql(sex.value));
    }
    if (handedness.present) {
      final converter = $PreferencesTable.$converter1n;
      map['handedness'] = Variable<int>(converter.toSql(handedness.value));
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (nativeLanguage.present) {
      final converter = $PreferencesTable.$converter2n;
      map['native_language'] =
          Variable<String>(converter.toSql(nativeLanguage.value));
    }
    if (soundLanguage.present) {
      final converter = $PreferencesTable.$converter3n;
      map['sound_language'] =
          Variable<String>(converter.toSql(soundLanguage.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesCompanion(')
          ..write('id: $id, ')
          ..write('sex: $sex, ')
          ..write('handedness: $handedness, ')
          ..write('age: $age, ')
          ..write('nativeLanguage: $nativeLanguage, ')
          ..write('soundLanguage: $soundLanguage')
          ..write(')'))
        .toString();
  }
}

class $PreferencesTable extends Preferences
    with TableInfo<$PreferencesTable, Preference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferencesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumnWithTypeConverter<Sex?, int> sex =
      GeneratedColumn<int>('sex', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<Sex?>($PreferencesTable.$converter0n);
  final VerificationMeta _handednessMeta = const VerificationMeta('handedness');
  @override
  late final GeneratedColumnWithTypeConverter<Handedness?, int> handedness =
      GeneratedColumn<int>('handedness', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<Handedness?>($PreferencesTable.$converter1n);
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _nativeLanguageMeta =
      const VerificationMeta('nativeLanguage');
  @override
  late final GeneratedColumnWithTypeConverter<Language?, String>
      nativeLanguage = GeneratedColumn<String>(
              'native_language', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Language?>($PreferencesTable.$converter2n);
  final VerificationMeta _soundLanguageMeta =
      const VerificationMeta('soundLanguage');
  @override
  late final GeneratedColumnWithTypeConverter<Language?, String> soundLanguage =
      GeneratedColumn<String>('sound_language', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Language?>($PreferencesTable.$converter3n);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sex, handedness, age, nativeLanguage, soundLanguage];
  @override
  String get aliasedName => _alias ?? 'preferences';
  @override
  String get actualTableName => 'preferences';
  @override
  VerificationContext validateIntegrity(Insertable<Preference> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_sexMeta, const VerificationResult.success());
    context.handle(_handednessMeta, const VerificationResult.success());
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    context.handle(_nativeLanguageMeta, const VerificationResult.success());
    context.handle(_soundLanguageMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Preference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Preference(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sex: $PreferencesTable.$converter0n.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}sex'])),
      handedness: $PreferencesTable.$converter1n.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}handedness'])),
      age: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      nativeLanguage: $PreferencesTable.$converter2n.fromSql(
          attachedDatabase.options.types.read(
              DriftSqlType.string, data['${effectivePrefix}native_language'])),
      soundLanguage: $PreferencesTable.$converter3n.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.string, data['${effectivePrefix}sound_language'])),
    );
  }

  @override
  $PreferencesTable createAlias(String alias) {
    return $PreferencesTable(attachedDatabase, alias);
  }

  static TypeConverter<Sex, int> $converter0 =
      const EnumIndexConverter<Sex>(Sex.values);
  static TypeConverter<Handedness, int> $converter1 =
      const EnumIndexConverter<Handedness>(Handedness.values);
  static TypeConverter<Language, String> $converter2 =
      const LanguageConverter();
  static TypeConverter<Language, String> $converter3 =
      const LanguageConverter();
  static TypeConverter<Sex?, int?> $converter0n =
      NullAwareTypeConverter.wrap($converter0);
  static TypeConverter<Handedness?, int?> $converter1n =
      NullAwareTypeConverter.wrap($converter1);
  static TypeConverter<Language?, String?> $converter2n =
      NullAwareTypeConverter.wrap($converter2);
  static TypeConverter<Language?, String?> $converter3n =
      NullAwareTypeConverter.wrap($converter3);
}

abstract class _$SharedDatabase extends GeneratedDatabase {
  _$SharedDatabase(QueryExecutor e) : super(e);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [preferences];
}
