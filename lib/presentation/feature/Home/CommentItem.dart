import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/comment/comment_entity.dart';

class CommentItemWidget extends StatefulWidget {
  const CommentItemWidget({super.key, required this.item});

  final CommentEntity item;

  @override
  State<CommentItemWidget> createState() => _CommentItemWidgetState();
}

class _CommentItemWidgetState extends State<CommentItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.item.user.name,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const Divider(
            height: 8,
            color: Colors.transparent,
          ),
          Text(
            widget.item.content,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
