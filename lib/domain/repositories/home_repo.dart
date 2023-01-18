import 'package:flutter_application_1/data/model/Comment/request/AddCommentRequestModel.dart';
import 'package:flutter_application_1/data/model/Comment/request/CommentRequestModel.dart';
import 'package:flutter_application_1/data/model/Post/request/PostRequestModel.dart';
import 'package:flutter_application_1/domain/entities/comment/add_comment_entity.dart';
import 'package:flutter_application_1/domain/entities/comment/list_comment_response_entity.dart';
import 'package:flutter_application_1/domain/entities/post/post_entity.dart';
import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';

abstract class HomeRepo {
  Future<PostResponseEntity> getPost(int page);

  Future<PostEntity> createPost(PostRequestModel request);

  Future<ListCommentResponseEntity> getComment(CommentRequestModel request);

  Future<AddCommentEntity> addComment(AddCommentRequestModel request);
}
