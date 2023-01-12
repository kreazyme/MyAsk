// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/usecases/post/create_post_usecase.dart';
import 'package:flutter_application_1/presentation/feature/Home/bloc/home_presenter.dart';
import 'package:flutter_application_1/presentation/feature/Home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/LoginPage.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
    );
  }
}

class CreateNewPostDialog extends StatefulWidget {
  const CreateNewPostDialog({super.key});

  @override
  State<CreateNewPostDialog> createState() => _CreateNewPostDialogState();
}

class _CreateNewPostDialogState extends State<CreateNewPostDialog> {
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
