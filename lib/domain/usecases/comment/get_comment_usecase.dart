import 'package:flutter_application_1/data/model/Comment/request/CommentRequestModel.dart';
import 'package:flutter_application_1/data/repositories/home_repo_impl.dart';
import 'package:flutter_application_1/domain/entities/comment/list_comment_response_entity.dart';
import 'package:flutter_application_1/domain/usecases/use_case.dart';

class GetCommentUsecase
    extends FutureUsecase<ListCommentResponseEntity, CommentRequestModel> {
  @override
  Future<ListCommentResponseEntity> run(CommentRequestModel request) {
    return HomeRepoImplement().getComment(request);
  }
}
