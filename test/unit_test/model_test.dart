import 'dart:convert';

import 'package:biys/data/model/base.dart';
import 'package:flutter_test/flutter_test.dart';

import '../json_reader.dart';

void main() {
  test('Test base method fromJson', () {
    String jsondata = readJson('dummy_data/list.json');
    BaseRestaurants base = BaseRestaurants.fromJson(json.decode(jsondata));

    // Check there's no error.
    expect(base.error, false);
    // Count list should be 20.
    expect(base.restaurants!.length, equals(20));
  });
}
