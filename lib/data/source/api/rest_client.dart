import 'package:biys/data/model/base.dart';
import 'package:biys/data/request/review_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://restaurant-api.dicoding.dev")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/list")
  Future<BaseRestaurants> getList();

  @GET("/search")
  Future<BaseRestaurants> getSearch(@Query("q") String query);

  @GET("/detail/{id}")
  Future<BaseRestaurant> getDetail(@Path("id") String id);

  @POST("/review")
  Future<BaseCustomerReviews> postReview(@Header("X-Auth-Token") String token,
      @Body() ReviewRequest reviewRequest);
}
