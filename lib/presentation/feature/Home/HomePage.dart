import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/feature/Home/bloc/home_presenter.dart';
import 'package:flutter_application_1/presentation/feature/Home/bloc/home_state.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Login/LoginPage.dart';
import '../Register/RegisterPage.dart';
import 'AddCommentDialog.dart';
import 'PostItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePresenter _homePresenter = HomePresenter();

  @override
  void initState() {
    super.initState();
    _homePresenter.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePresenter, HomeState>(
      bloc: _homePresenter,
      listener: (context, state) => {},
      builder: (context, state) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: showCustomDialog,
        ),
        appBar: AppBar(
          title: const Text("Ask me something"),
          actions: [
            Container(
              child: !state.isLogin
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
              child: !state.isLogin
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
                child: !state.isLogin
                    ? Container()
                    : MaterialButton(
                        onPressed: _homePresenter.logout,
                        child: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: state.isLoading == LoadingState.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  PostItemWidget(item: state.data.posts[index]),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    height: 2,
                                  ),
                              itemCount: state.data.posts.length),
                        )),
              Container(
                child: state.isLoading == LoadingState.loadMore
                    ? Container(
                        margin: const EdgeInsets.all(20),
                        child: const CircularProgressIndicator(),
                      )
                    : Container(),
              ),
              Container(
                  child: state.curentPage < state.data.totalPage &&
                          state.isLoading == LoadingState.success
                      ? Container(
                          margin: const EdgeInsets.all(20),
                          child: MaterialButton(
                            onPressed: () {
                              _homePresenter.loadMore(state.curentPage + 1);
                            },
                            child: const Text("Load more posts"),
                          ),
                        )
                      : Container()),
            ],
          ),
        ),
      ),
    );
  }

  void showCustomDialog() {
    showDialog(
      context: context,
      builder: (ctx) => _homePresenter.state.isLogin == true
          ? const CreateNewPostDialog()
          : const LoginDialog(),
    );
  }
}
