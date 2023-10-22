import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:icon_shopper/core/utils/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.home).existsSync(), isTrue);
    expect(File(Images.logoSmall).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
  });
}
