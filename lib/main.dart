import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/usecases/auth/init_token_usecase.dart';

import 'presentation/feature/Home/HomePage.dart';

Future<void> main() async {
  runApp(const MyApp());
  await InitTokenUsecase().run();
  // await Hive.initFlutter();
  // await Hive.openBox("user");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kreazy Ask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
