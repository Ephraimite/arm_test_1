import 'package:flutter_test/flutter_test.dart';
import 'package:arm_test_1/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SuccessScreenViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
