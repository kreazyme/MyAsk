// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/services/ApiService.dart';
import 'package:flutter_application_1/domain/usecases/post/create_post_usecase.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Login/LoginPage.dart';

class AddCommentWidget extends StatefulWidget {
  const AddCommentWidget({super.key});

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  String? token;
  void showCustomDialog() {
    showDialog(
      context: context,
      builder: (ctx) => const CreateNewPostWidget(),
    );
  }

  void showLoginDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("You need to login to post"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }

  Future<void> setToken() async {
    try {
      var box = Hive.box("user");
      setState(() {
        token = box.get("token");
      });
    } catch (e) {
      token = null;
    }
  }

  @override
  void initState() {
    super.initState();
    setToken();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: token == null ? showLoginDialog : showCustomDialog,
      child: const Icon(Icons.add),
    );
  }
}

class CreateNewPostWidget extends StatefulWidget {
  const CreateNewPostWidget({super.key});

  @override
  State<CreateNewPostWidget> createState() => _CreateNewPostWidgetState();
}

class _CreateNewPostWidgetState extends State<CreateNewPostWidget> {
  String content = "";
  final CreatePostUsecase _createPostUsecase = CreatePostUsecase();
  Future<void> createPost() async {
    await _createPostUsecase.run(content);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("What do you want to ask ?"),
      content: TextField(
          onChanged: (value) {
            setState(() {
              content = value;
            });
          },
          maxLines: 5,
          minLines: 1,
          decoration: const InputDecoration(
            hintText: "Enter your question",
          )),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        MaterialButton(
          onPressed: () async {
            if (content != "") {
              await createPost();
              Navigator.of(context).pop();
            }
          },
          child: Text(
            "Post",
            style: TextStyle(color: content == "" ? Colors.red : Colors.black),
          ),
        ),
      ],
    );
  }
}
