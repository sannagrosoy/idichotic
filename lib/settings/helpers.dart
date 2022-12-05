import 'package:dichotic/settings/types/handedness.dart';

import '../db/database.dart';
import 'types/sex.dart';

bool isUnsetOrUnspecified(Preference? prefs) {
  bool unset = prefs == null
    || prefs.soundLanguage == null
    || prefs.handedness == null
    || prefs.sex == null;

  // Sound language should always be specified, no difference between unset or unspecified for nativeLanguage or age.
  bool unspecified = prefs == null
    || prefs.sex == Sex.unspecified
    || prefs.handedness == Handedness.unspecified
    || prefs.nativeLanguage == null
    || prefs.age == null;

  return unset || unspecified;
}