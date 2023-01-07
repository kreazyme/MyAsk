import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';
import 'package:flutter_application_1/domain/usecases/post/get_post_usecase.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Login/LoginPage.dart';
import '../Register/RegisterPage.dart';
import 'AddCommentWidget.dart';
import 'PostItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoadingState loadingState = LoadingState.loading;
  late PostResponseEntity? posts;
  String? token;
  int totalPage = 1;
  int currentPage = 1;
  final GetPostUsecase _getPostUsecase = GetPostUsecase();

  Future<void> getPost() async {
    posts = await _getPostUsecase.run(1);
    setState(() {
      loadingState = LoadingState.success;
      totalPage = posts?.totalPage ?? 1;
    });
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
    getPost();
    setToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddCommentWidget(),
      appBar: AppBar(
        title: const Text("Ask me something"),
        actions: [
          Container(
            child: token == null
                ? MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container(),
          ),
          Container(
            child: token == null
                ? MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container(),
          ),
          Container(
              child: token == null
                  ? Container()
                  : MaterialButton(
                      onPressed: () {
                        Hive.box("user").delete("token");
                        setState(() {
                          token = null;
                        });
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              child: loadingState == LoadingState.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              PostItemWidget(item: posts!.posts[index]),
                          separatorBuilder: (context, index) => const Divider(
                                height: 2,
                              ),
                          itemCount: posts!.posts.length),
                    )),
          Container(
              child: currentPage < totalPage &&
                      loadingState == LoadingState.success
                  ? MaterialButton(
                      onPressed: () async {
                        // var newPost =
                        //     await ApiService().getPost(page: currentPage + 1);
                        // setState(() {
                        //   posts!.data!.addAll(newPost.data!);
                        //   currentPage = newPost.currentPage!;
                        // });
                      },
                      child: const Text("Load more"),
                    )
                  : Container())
        ]),
      ),
    );
  }
}
