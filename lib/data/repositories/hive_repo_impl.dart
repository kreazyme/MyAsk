import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/local/database_impl.dart';
import 'package:flutter_application_1/domain/local/database.dart';
import 'package:flutter_application_1/domain/repositories/hive_repo.dart';

class HiveRepoImplement implements HiveRepository {
  final DataBase _dataBase = DataBaseImplement();

  @override
  Future<String> getToken() async {
    var token = await _dataBase.get("token");
    return token;
  }

  @override
  Future<void> setToken(String token) async {
    try {
      return _dataBase.set(token);
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  @override
  Future deleteToken() async {
    await _dataBase.delete();
  }

  @override
  Future init() async {
    return _dataBase.init();
  }
}
