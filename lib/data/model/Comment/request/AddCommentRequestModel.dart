class AddCommentRequestModel {
  final String content;
  final String postId;

  const AddCommentRequestModel({
    required this.content,
    required this.postId,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'post_id': postId,
    };
  }
}
