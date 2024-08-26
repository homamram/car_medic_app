import 'dart:convert';

import 'package:car_medic/app/app_config.dart';
import 'package:car_medic/core/data/models/api/amin_info_model.dart';
import 'package:car_medic/core/data/models/api/user_info_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

class HiveRepository {
  static String HIVE_FIRST_LOGIN = "first_login";
  static String HIVE_LOGIN_MODEL = 'login_model';
  static String HIVE_GALLARY_MODEL = 'galary_model';
  static String HIVE_Camera_MODEL = 'camera_model';
  static String HIVE_ROLE_MODEL = 'role_model';
  String HIVE_FCM_TOKEN = 'fcm_token';
  static String HIVE_TOKEN_INFO = 'token_info';
  static String HIVE_USER_INFO = 'user_info';
  static String HIVE_ADMIN_INFO = 'admin_info';
  String PREF_APP_LANG = 'app_languages';
  static String HIVE_GENERAL_BOX = "app_general_info";
  late Box primaryBox;

  Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    primaryBox = await Hive.openBox(HIVE_GENERAL_BOX);
  }

  Future<void> clearHive() async {
    if (primaryBox.isNotEmpty) {
      await primaryBox.clear();
    }
  }

  Future<void> openHive() async {
    primaryBox = await Hive.openBox(HIVE_GENERAL_BOX);
  }

  Future<void> setAppLanguage(String value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(PREF_APP_LANG, value);
  }

  String get getAppLanguage => Hive.box(HIVE_GENERAL_BOX)
      .get(PREF_APP_LANG, defaultValue: AppConfig.defaultLanguage);

  Future<void> setTokenInfo(String value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(HIVE_TOKEN_INFO, value);
  }



  String get getTokenInfo =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_TOKEN_INFO, defaultValue: '');

  Future<void> setUserInfo(UserInfo value) async {
    await Hive.box(HIVE_GENERAL_BOX)
        .put(HIVE_USER_INFO, jsonEncode(value.toJson()));
  }

  UserInfo? getUserInfo() {
    if (Hive.box(HIVE_GENERAL_BOX).containsKey(HIVE_USER_INFO)) {
      return UserInfo.fromJson(jsonDecode(
          Hive.box(HIVE_GENERAL_BOX).get(HIVE_USER_INFO, defaultValue: {})));
    } else {
      return null;
    }
  }

  Future<void> setAdminInfo(AdminInfo value) async {
    await Hive.box(HIVE_GENERAL_BOX)
        .put(HIVE_ADMIN_INFO, jsonEncode(value.toJson()));
  }

  AdminInfo? getAdminInfo() {
    if (Hive.box(HIVE_GENERAL_BOX).containsKey(HIVE_ADMIN_INFO)) {
      return AdminInfo.fromJson(jsonDecode(
          Hive.box(HIVE_GENERAL_BOX).get(HIVE_ADMIN_INFO, defaultValue: {})));
    } else {
      return null;
    }
  }

  Future<void> setfcmTokenInfo(String value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(HIVE_FCM_TOKEN, value);
  }

  String get getfcmTokenInfo =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_FCM_TOKEN, defaultValue: '');

  Future<void> setGallary(String value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(HIVE_GALLARY_MODEL, value);
  }

  String get getGallary =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_GALLARY_MODEL, defaultValue: '');

  Future<void> setRole(String value) async {
    await Hive.box(HIVE_GENERAL_BOX).put(HIVE_ROLE_MODEL, value);
  }
  String get getRole =>
      Hive.box(HIVE_GENERAL_BOX).get(HIVE_ROLE_MODEL, defaultValue: '');
}
