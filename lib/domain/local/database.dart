import 'package:hive_flutter/hive_flutter.dart';

abstract class DataBase {
  Box get box;
  Future init();
  Future<String> get(String token);
  Future<void> set(String input);
  Future delete();
}
