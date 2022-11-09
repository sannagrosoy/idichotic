import 'package:drift/drift.dart';

import '../settings/preferences.dart';
import '../settings/types/sex.dart';
import '../settings/types/handedness.dart';
import '../settings/types/language.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Preferences])
class SharedDatabase extends _$SharedDatabase {
  SharedDatabase(QueryExecutor e): super(e);

  @override
  int get schemaVersion => 1;
}
