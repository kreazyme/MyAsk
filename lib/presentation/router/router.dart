import 'package:flutter_application_1/presentation/feature/Error/ErrorPage.dart';
import 'package:flutter_application_1/presentation/feature/Home/HomePage.dart';
import 'package:flutter_application_1/presentation/feature/Login/LoginPage.dart';
import 'package:flutter_application_1/presentation/feature/Register/RegisterPage.dart';
import 'package:go_router/go_router.dart';

GoRouter globalRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      // redirect: (context, state) => "/home",
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: "home",
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: "login",
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: "register",
          builder: (context, state) => const RegisterPage(),
        ),
      ],
    )
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
