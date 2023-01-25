import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/usecases/auth/init_token_usecase.dart';
import 'package:flutter_application_1/presentation/router/router.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  runApp(const HomeRouter());
  await InitTokenUsecase().run();
}

class HomeRouter extends StatelessWidget {
  const HomeRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kreazy Ask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: globalRouter,
    );
  }
}
