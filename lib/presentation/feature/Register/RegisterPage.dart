// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/User/request/RegisterRequestModel.dart';
import 'package:flutter_application_1/domain/usecases/user/register_usecase.dart';
import 'package:hive_flutter/adapters.dart';
import '../Home/HomePage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterUsecase _registerUsecase = RegisterUsecase();

  Future<void> register() async {
    var request = RegisterRequestModel(
      username: username,
      password: password,
      name: name,
    );
    var response = await _registerUsecase.run(request);
    if (response != "") {
      await Hive.openBox("user");
      Hive.box("user").put("token", response);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  String name = "";
  String password = "";
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            TextField(
              onChanged: (value) => setState(() {
                username = value;
              }),
              maxLines: 1,
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
              onChanged: (value) => setState(() {
                password = value;
              }),
              maxLines: 1,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined),
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
            ),
            const Divider(
              height: 20,
            ),
            TextField(
              onChanged: (value) => setState(() {
                name = value;
              }),
              maxLines: 1,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                label: Text("Your name or Alias"),
                border: OutlineInputBorder(),
              ),
            ),
            const Divider(
              height: 20,
              color: Colors.transparent,
            ),
            TextButton(
                onPressed: () {
                  register();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(20),
                  backgroundColor: name.length < 4 ||
                          password.length < 6 ||
                          username.length < 2
                      ? Colors.grey
                      : Colors.blue,
                ),
                child: const Text("Register")),
          ])),
    );
  }
}
