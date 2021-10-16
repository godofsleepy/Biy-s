import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [],
  customMocks: [MockSpec<Dio>(as: #MockDio)],
)
void main() {}
