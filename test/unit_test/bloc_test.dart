import 'dart:convert';

import 'package:biys/data/model/base.dart';
import 'package:biys/data/model/restaurant.dart';
import 'package:biys/data/source/api/rest_client.dart';
import 'package:biys/screen/home/bloc/home_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/scaffolding.dart';

import '../json_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  const BASE_URL = "https://restaurant-api.dicoding.dev/";
  late RestClient mockClient;
  late Dio dio;
  late DioAdapter dioAdapter;
  late List<Restaurant> list;

  setUp(() {
    dio = Dio();
    mockClient = RestClient(dio, baseUrl: BASE_URL);
    dioAdapter = DioAdapter(dio: dio);

    list =
        BaseRestaurants.fromJson(json.decode(readJson('dummy_data/list.json')))
            .restaurants!;
  });
  group("home cubit", () {
    dioAdapter.onGet(
      "$BASE_URL/list",
      (server) => server.reply(200, readJson('dummy_data/list.json')),
    );
    blocTest<HomeCubit, HomeState>(
      'when build cubit',
      build: () => HomeCubit(mockClient),
      expect: () => [],
    );

    blocTest<HomeCubit, HomeState>(
      'when load list ',
      build: () => HomeCubit(mockClient),
      act: (bloc) => bloc.loadRestaurant(),
      expect: () => [
        HomeState(status: HomeStatus.loading),
        HomeState(status: HomeStatus.success, data: list),
      ],
    );
  });
}
