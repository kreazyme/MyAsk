import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/model/Post/PostModel.dart';
import 'package:flutter_application_1/data/model/User/request/LoginrequestModel.dart';
import 'package:flutter_application_1/data/model/User/request/RegisterRequestModel.dart';
import 'package:flutter_application_1/domain/entities/post/post_response_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'ApiConstant.dart';

class ApiService {
  Future<PostResponseEntity?> getPost(int page) async {
    try {
      var url = Uri.parse(ApiConstant.getPost);
      debugPrint(url.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return PostModel.fromJson(json.decode(response.body)).toEntity();
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<String?> register(RegisterRequestModel request) async {
    try {
      var url = Uri.parse(ApiConstant.register);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(request));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to register');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<String?> login(LoginRequestModel request) async {
    try {
      var url = Uri.parse(ApiConstant.login);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: request.toJson());
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data["token"];
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      debugPrint(error.toString());
      throw Exception(error);
    }
  }

  Future<String?> createPost(String content) async {
    String token = await Hive.box("user").get("token");
    try {
      var url = Uri.parse(ApiConstant.createPost);
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": token,
          },
          body: json.encode({"content": content}));
      return response.body;
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
