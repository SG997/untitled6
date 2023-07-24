import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../datamodel/coutnries/countries.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient getAPI(){
    Dio dio = Dio();

    dio.options.baseUrl = "https://api.nobelprize.org";

    dio.interceptors.add(LogInterceptor());
    RestClient restApiCalls = RestClient(dio);

    return restApiCalls;
  }

  @GET("/v1/country.json")
  Future<Countries> getCountries();
}