import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/post/post_entity.dart';
import 'package:flutter_application_1/presentation/feature/Post/PostDetailPage.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';

import 'CommentItem.dart';

class PostItemWidget extends StatefulWidget {
  const PostItemWidget({super.key, required this.item});

  final PostEntity item;

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  LoadingState isLoading = LoadingState.success;
  int currentPage = 1;
  int totalPage = 2;

  void loadmoreComment() {
    if (currentPage < totalPage) {
      setState(() {
        currentPage++;
        isLoading = LoadingState.loading;
      });
    }
    setState(() {
      isLoading = LoadingState.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPostPage(
                  post: widget.item,
                ),
              ));
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.user.name,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const Divider(
              height: 8,
              color: Colors.transparent,
            ),
            Text(
              widget.item.content,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Container(
              child: widget.item.comments.isEmpty
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        children: [
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  CommentItemWidget(
                                      item: widget.item.comments[index]),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    height: 8,
                                    color: Colors.transparent,
                                  ),
                              itemCount: widget.item.comments.length),
                          Container(
                            child: isLoading == LoadingState.loading
                                ? Container(
                                    width: 20,
                                    height: 20,
                                    margin: const EdgeInsets.only(top: 4),
                                    child: const CircularProgressIndicator())
                                : Container(),
                          ),
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
