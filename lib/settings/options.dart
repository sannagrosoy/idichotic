import 'package:isar/isar.dart';

import 'types/dominanthand.dart';
import 'types/sex.dart';

part 'options.g.dart';

@collection
class Options {
  Id id = 0;

  @Enumerated(EnumType.name)
  DominantHand? dominantHand;

  @Enumerated(EnumType.name)
  Sex? sex;

  String? language;

  int? age;
}