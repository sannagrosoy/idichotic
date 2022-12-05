// SPDX-FileCopyrightText: 2022 iDichotic+ Authors <https://dichotic.app>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

export 'unsupported.dart'
  if (dart.library.js) 'web.dart'
  if (dart.library.ffi) 'native.dart';