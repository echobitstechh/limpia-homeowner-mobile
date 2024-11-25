import 'package:flutter_test/flutter_test.dart';
import 'package:echobitstech/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DrawsViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
