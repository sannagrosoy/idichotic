// SPDX-FileCopyrightText: 2022 iDichotic+ Authors <https://dichotic.app>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:drift/web.dart';

import 'database.dart';

SharedDatabase constructDb() {
  return SharedDatabase(WebDatabase('db'));
}