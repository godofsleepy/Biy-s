import 'dart:convert';

import 'package:biys/data/model/base.dart';
import 'package:flutter_test/flutter_test.dart';

import '../json_reader.dart';

void main() {
  test('Test base method fromJson', () {
    String jsondata = readJson('dummy_data/list.json');
    BaseRestaurants base = BaseRestaurants.fromJson(json.decode(jsondata));
    expect(base.error, false);
    expect(base.restaurants!.length, equals(20));
  });
}
