// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:base_flutter_bloc/app/app.dart';
import 'package:base_flutter_bloc/bootstrap.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.development,
    values: FlavorValues(baseUrl: 'http://10.0.2.2:8080'),
  );
  bootstrap(() => const MyApp());
}
