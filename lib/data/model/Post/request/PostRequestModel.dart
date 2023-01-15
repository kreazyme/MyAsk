class PostRequestModel {
  String content;
  PostRequestModel({
    required this.content,
  });
  factory PostRequestModel.fromJson(Map<String, dynamic> json) =>
      PostRequestModel(
        content: json['content'],
      );
  Map<String, dynamic> toJson() => {
        'content': content,
      };
}
