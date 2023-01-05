import 'package:flutter_application_1/data/services/ApiService.dart';
import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';
import 'package:flutter_application_1/domain/repositories/home_repo.dart';

class HomeRepoImplement extends HomeRepo {
  final ApiService _apiService = ApiService();

  @override
  Future<PostResponseEntity> getPost(int page) async {
    var response = await _apiService.getPost(page);
    return response ?? PostResponseEntity(posts: [], totalPage: 1);
  }

  @override
  Future<void> createPost(String content) {
    var response = _apiService.createPost(content);
    return response;
  }
}
