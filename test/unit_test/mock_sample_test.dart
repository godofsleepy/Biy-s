import 'dart:convert';

import 'package:biys/data/model/base.dart';
import 'package:biys/data/source/api/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../json_reader.dart';

void main() {
  const BASE_URL = "https://restaurant-api.dicoding.dev/";
  late RestClient mockClient;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();
    mockClient = RestClient(dio, baseUrl: BASE_URL);
    dioAdapter = DioAdapter(dio: dio);
  });

  group("Sample Group", () {
    String jsondata = readJson('dummy_data/list.json');
    BaseRestaurants base = BaseRestaurants.fromJson(json.decode(jsondata));

    test("should return success", () async {
      dioAdapter.onGet(
        "$BASE_URL/list",
        (server) => server.reply(200, readJson('dummy_data/list.json')),
      );
      // act
      final result = await mockClient.getList();
      // assert
      expect(result, equals(base));
    });
  });
}
