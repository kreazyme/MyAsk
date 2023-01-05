// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/User/request/LoginrequestModel.dart';
import 'package:flutter_application_1/domain/usecases/user/login_usecase.dart';
import 'package:hive_flutter/adapters.dart';

import '../Home/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = "";
  String username = "";
  final LoginUsecase _loginUsecase = LoginUsecase();

  Future<void> login() async {
    var request = LoginRequestModel(username: username, password: password);
    try {
      var token = await _loginUsecase.run(request);
      if (token != "") {
        print(token);
        await Hive.openBox("user");
        await Hive.box("user").put("token", token);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
      } else {
        showCustomDialog("Login failed");
      }
    } catch (e) {
      showCustomDialog("Wrong username or password");
    }
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
    return Scaffold(
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
            color: username.length < 2 || password.length < 6
                ? Colors.grey
                : Colors.blue,
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
