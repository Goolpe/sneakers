import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sneakers/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.sneaker01).existsSync(), true);
    expect(File(Images.sneaker02).existsSync(), true);
    expect(File(Images.sneaker03).existsSync(), true);
    expect(File(Images.sneaker04).existsSync(), true);
  });
}
