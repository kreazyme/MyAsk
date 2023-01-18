import 'package:flutter_application_1/domain/local/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataBaseImplement extends DataBase {
  // DataBaseImplement() {
  //   init();
  // }

  @override
  Box get box => Hive.box("user");

  @override
  Future<String> get(String token) async {
    await init();
    final String response = await box.get(token) ?? "";
    return response;
  }

  @override
  Future<void> set(String input) async {
    await box.put("token", input);
  }

  @override
  Future delete() async {
    await box.delete("token");
  }

  @override
  Future init() async {
    await Hive.initFlutter();
    await Hive.openBox("user");
  }
}
