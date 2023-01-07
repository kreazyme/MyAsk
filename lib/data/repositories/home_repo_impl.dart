import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/services/api_client.dart';
import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';
import 'package:flutter_application_1/domain/repositories/home_repo.dart';
import 'package:hive/hive.dart';

class HomeRepoImplement extends HomeRepo {
  final _apiClient = ApiClient(Dio());

  @override
  Future<PostResponseEntity> getPost(int page) async {
    var response = await _apiClient.getPost(page);
    return response.toEntity();
  }

  @override
  Future<void> createPost(String content) async {
    String token = await Hive.box("user").get("token");
    _apiClient.createPost(content, token);
  }
}
