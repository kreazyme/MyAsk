import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "404 Error!\nPage not found",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go("/home");
              },
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
