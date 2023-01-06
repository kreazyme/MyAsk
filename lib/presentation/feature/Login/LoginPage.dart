// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/User/request/LoginrequestModel.dart';
import 'package:flutter_application_1/domain/usecases/user/login_usecase.dart';
import 'package:flutter_application_1/presentation/feature/Login/bloc/login_presenter.dart';
import 'package:flutter_application_1/presentation/feature/Login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../resource/AppEnum.dart';
import '../Home/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = "";
  String username = "";
  final LoginPresenter _loginPresenter = LoginPresenter();

  Future<void> login() async {
    var request = LoginRequestModel(username: username, password: password);
    _loginPresenter.login(request);
  }

  void showCustomDialog(String title) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Error"),
        content: Text(title),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPresenter, LoginState>(
      listener: (context, state) => {
        if (state.isLoading == LoadingState.error)
          {showCustomDialog("Wrong username or password")}
        else if (state.isLoading == LoadingState.success)
          {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false)
          }
      },
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading,
      bloc: _loginPresenter,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            TextField(
              maxLines: 1,
              onChanged: (value) => setState(() {
                username = value;
              }),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                label: Text("Username"),
                border: OutlineInputBorder(),
              ),
            ),
            const Divider(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const Divider(
              height: 50,
              color: Colors.transparent,
            ),
            MaterialButton(
              onPressed:
                  username.length < 2 || password.length < 6 ? () {} : login,
              color: state.isLoading == LoadingState.loading
                  ? Colors.grey
                  : Colors.blue,
              child: state.isLoading == LoadingState.loading
                  ? const CircularProgressIndicator()
                  : const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }
}
