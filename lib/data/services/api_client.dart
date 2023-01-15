import 'package:flutter_application_1/data/model/Post/PostModel.dart';
import 'package:flutter_application_1/data/model/Post/request/PostRequestModel.dart';
import 'package:flutter_application_1/data/model/User/request/LoginrequestModel.dart';
import 'package:flutter_application_1/data/model/User/request/RegisterRequestModel.dart';
import 'package:flutter_application_1/data/model/User/response/RegisterResponseModel.dart';
import 'package:flutter_application_1/data/services/ApiConstant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstant.BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(ApiConstant.getPost)
  Future<PostModel> getPost(
    @Query("page") int page,
  );

  @POST(ApiConstant.register)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestModel request,
  );

  @POST(ApiConstant.login)
  Future<RegisterResponseModel> login(
    @Body() LoginRequestModel request,
  );

  @POST(ApiConstant.createPost)
  Future<PostItemModel> createPost(
    @Header("Authorization") String token,
    @Body() PostRequestModel content,
  );
}
