import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/model/Comment/request/AddCommentRequestModel.dart';
import 'package:flutter_application_1/data/model/Comment/request/CommentRequestModel.dart';
import 'package:flutter_application_1/data/model/Post/request/PostRequestModel.dart';
import 'package:flutter_application_1/data/services/api_client.dart';
import 'package:flutter_application_1/domain/entities/comment/add_comment_entity.dart';
import 'package:flutter_application_1/domain/entities/comment/list_comment_response_entity.dart';
import 'package:flutter_application_1/domain/entities/post/post_entity.dart';
import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';
import 'package:flutter_application_1/domain/repositories/home_repo.dart';
import 'package:flutter_application_1/domain/usecases/auth/get_token_usecase.dart';

class HomeRepoImplement extends HomeRepo {
  final _apiClient = ApiClient(Dio());
  final GetTokenUsecase _getTokenUsecase = GetTokenUsecase();

  @override
  Future<PostResponseEntity> getPost(int page) async {
    var response = await _apiClient.getPost(page);
    return response.toEntity();
  }

  @override
  Future<PostEntity> createPost(PostRequestModel request) async {
    String token = await _getTokenUsecase.run();
    final post = await _apiClient.createPost(token, request);
    return post.toEntity();
  }

  @override
  Future<ListCommentResponseEntity> getComment(
      CommentRequestModel request) async {
    final data = await _apiClient.getComment(request.postId, request.page);
    return data.toEntity();
  }

  @override
  Future<AddCommentEntity> addComment(AddCommentRequestModel request) async {
    String token = await _getTokenUsecase.run();
    var response = await _apiClient.addComment(token, request);
    return response.toEntity();
  }
}
