import 'dart:developer';
import 'package:car_medic/core/data/models/api/user_info_model.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:dartz/dartz.dart';
import 'package:car_medic/core/data/models/common_respons.dart';
import 'package:car_medic/core/data/network/endpoints/user_endpoints.dart';
import 'package:car_medic/core/data/network/network_config.dart';
import 'package:car_medic/core/enums/request_type.dart';
import 'package:car_medic/core/utils/network_utils.dart';

class UserRepository {
  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.login,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'email': email,
            'password': password,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            log('==========> ${commonResponse.data!['user']}');
            storage
                .setUserInfo(UserInfo.fromJson(commonResponse.data!['user']));
            log('======user    ====> ${storage.getUserInfo()!.email}');

            storage.setTokenInfo(commonResponse.data!['token']);
            return Right(commonResponse.data!['message']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> verifyResetPassword({
    required String code,
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.verifyResetPassword,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'code': code,
            'email': email,
          }).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['message']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> resetPassword({
    required String newPassword,
    required String confirmPassword,
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.resetPassword,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'newPassword': newPassword,
            'confirmPassword': confirmPassword,
            'email': email,
          }).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['message']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> forgetPassword({
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.forgetPassword,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'email': email,
          }).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['message']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> verify({
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndPoints.verifyCode,
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
        body: {
          'email': email,
        },
      ).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['message']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> sendCode({
    required String code,
    required String email,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.sendCode,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {'code': code, 'email': email}).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            storage
                .setUserInfo(UserInfo.fromJson(commonResponse.data!['user']));
            storage.setTokenInfo(commonResponse.data!['token']);
            return Right(commonResponse.data!['message']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String lastName,
    required String firstName,
    required String carNumber,
    required String carModel,
    required String carType,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndPoints.register,
        body: {
          'email': email,
          'fcmToken': storage.getfcmTokenInfo,
          'username': firstName,
          'password': password,
          'confirmPassword': password,
          'lastName': lastName,
          'firstName': firstName,
          'carNumber': carNumber,
          'carModel': carModel,
          'carType': carType,
        },
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
      ).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            storage.setRole('user');
            storage
                .setUserInfo(UserInfo.fromJson(commonResponse.data!['user']));
            return Right(commonResponse.data!['message']);

          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> editProfile({
    required String lastName,
    required String firstName,
    required String carNumber,
    required String carModel,
    required String carType,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndPoints.editProfile,
        body: {
          'lastName': lastName,
          'firstName': firstName,
          'username': storage.getUserInfo()!.username,
          'newusername': firstName,
          'carNumber': carNumber,
          'carModel': carModel,
          'carType': carType,
        },
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
      ).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            storage
                .setUserInfo(UserInfo.fromJson(commonResponse.data!['user']));

            return Right(commonResponse.data!['message']);


          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<dynamic>>> pro() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndPoints.pro,
        body: {},
        headers: NetworkConfig.getHeaders(type: RequestType.POST),
      ).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['pro']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, String>> GetPro() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.getpro,
          headers:
          NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {'username': storage.getUserInfo()!.username, 'Payment': 1000000}).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
          CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['message']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> getapplanguges() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndPoints.getlangouges,
          headers:
          NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'deviceLanguage': storage.getAppLanguage,

          }).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
          CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['message']);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return  Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
