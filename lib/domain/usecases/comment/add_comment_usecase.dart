import 'package:flutter_application_1/data/model/Comment/request/AddCommentRequestModel.dart';
import 'package:flutter_application_1/data/repositories/home_repo_impl.dart';
import 'package:flutter_application_1/domain/entities/comment/add_comment_entity.dart';
import 'package:flutter_application_1/domain/usecases/use_case.dart';

class AddCommentUsecase
    extends FutureUsecase<AddCommentEntity, AddCommentRequestModel> {
  @override
  Future<AddCommentEntity> run(AddCommentRequestModel request) async {
    return await HomeRepoImplement().addComment(request);
  }
}
