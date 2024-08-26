import 'dart:developer';
import 'package:car_medic/core/data/models/api/Statiscs_model.dart';
import 'package:car_medic/core/data/models/api/amin_info_model.dart';
import 'package:car_medic/core/data/network/endpoints/admin_endpoint.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:dartz/dartz.dart';
import '../../enums/request_type.dart';
import '../../utils/general_util.dart';
import '../../utils/network_utils.dart';
import '../models/api/problem_model.dart';
import '../models/common_respons.dart';
import '../network/network_config.dart';

class AdminRepositories {
  Future<Either<String, List<ProblemHistoryModel>>> getHistoryProblem() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.getHistoryProblem,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {}).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<ProblemHistoryModel> historyProblem = [];
            for (Map<String, dynamic> s in commonResponse.data!) {
              historyProblem.add(ProblemHistoryModel.fromJson(s));
            }
            print(historyProblem.length);
            return Right(historyProblem);
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

  Future<Either<String, String>> updateOrderProblem({
    required String orderId,
    required int price,
    required String date,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.updateOrderProblem,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'orderId': orderId,
            'price': price,
            'date': date,
          }).then((response) {
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

  Future<Either<String, String>> DeletOrderProblem({
    required String orderId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.deleteOrderProblem,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'orderId': orderId,
          }).then((response) {
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

  Future<Either<String, String>> AddPark({
    required String AdminEmail,
    required int price,
    required int NumberOfCarRepairPlaces,
    required String parkingName,
    required double lat,
    required double long,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.addPark,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'AdminEmail': AdminEmail,
            'Price': price,
            'parkingName': parkingName,
            'NumberOfCarRepairPlaces': NumberOfCarRepairPlaces,
            'parklat': lat,
            'parklong': long,
          }).then((response) {
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

  Future<Either<String, String>> adminlogin({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.adminlogin,
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
            log('==========> ${commonResponse.data!['admin']}');
            storage.setAdminInfo(
                AdminInfo.fromJson(commonResponse.data!['admin']));
            storage.setTokenInfo(commonResponse.data!['token']);
            log('==========> ${storage.getAdminInfo()}');
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

  Future<Either<String, List<AdminParks>>> getAdminParks() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.getparks,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'AdminEmail': storage.getAdminInfo()!.email,
          }).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<AdminParks> parks = [];
            for (Map<String, dynamic> s in commonResponse.data!) {
              parks.add(AdminParks.fromJson(s));
            }
            return Right(parks);
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

  Future<Either<String, String>> updatepark({
    required String AdminEmail,
    required String parkingName,
    required String newParkingName,
    required int Price,
    required int newPrice,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.editPark,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'AdminEmail': AdminEmail,
            'parkingName': parkingName,
            'newParkingName': newParkingName,
            'Price': Price,
            'newPrice': newPrice,
          }).then((response) {
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

  Future<Either<String, String>> settigns({
    required String AdminEmail,
    required String newAdminEmail,
    required String username,
    required String newusername,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.settigns,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'AdminEmail': AdminEmail,
            'newAdminEmail': newAdminEmail,
            'username': username,
            'newusername': newusername,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            print(commonResponse.data);
            AdminInfo adminInfo =
                AdminInfo.fromJson(commonResponse.data!['message']);
            storage.setAdminInfo(adminInfo);
            return const Right('Done');
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


  Future<Either<String, List<StatisticsModel>>> totalRevenue() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.totalRevenu,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            "AdminEmail":storage.getAdminInfo()!.email
          }).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<StatisticsModel> totalRevenue = [];
            for (Map<String, dynamic> s in commonResponse.data!['result']) {
              totalRevenue.add(StatisticsModel.fromJson(s));
            }
            print(totalRevenue.length);
            return Right(totalRevenue);
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

  Future<Either<String, List<StatisticsModel>>> numberofLocation({
    required String parkingname,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.numberoflocationbypark,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            "AdminEmail":storage.getAdminInfo()!.email,
            "parkName" : parkingname
          }).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<StatisticsModel> numberofLocation = [];
            for (Map<String, dynamic> s in commonResponse.data!['result']) {
              numberofLocation.add(StatisticsModel.fromJson(s));
            }
            print(numberofLocation.length);
            return Right(numberofLocation);
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
  Future<Either<String, List<StatisticsModel>>> totalrevenuebypark({
    required String parkingname,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.TotalRevenueByPark,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            "AdminEmail":storage.getAdminInfo()!.email,
            "parkName" : parkingname
          }).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<StatisticsModel> totalrevenuebypark = [];
            for (Map<String, dynamic> s in commonResponse.data!['result']) {
              totalrevenuebypark.add(StatisticsModel.fromJson(s));
            }
            print(totalrevenuebypark.length);
            return Right(totalrevenuebypark);
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

  Future<Either<String, List<StatisticsModel>>> repairordersbyproblem({
    required String parkingname,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.repairordersbyproblem,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            "AdminEmail":storage.getAdminInfo()!.email,
            "parkName" : parkingname
          }).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<dynamic> commonResponse =
          CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<StatisticsModel> repairordersbyproblem = [];
            for (Map<String, dynamic> s in commonResponse.data!['result']) {
              repairordersbyproblem.add(StatisticsModel.fromJson(s));
            }
            print(repairordersbyproblem.length);
            return Right(repairordersbyproblem);
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


  Future<Either<String, List<StatisticsModel>>> getCountAllPark({
    required String AdminEmail,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: AdminEndpoint.countAllPark,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'AdminEmail': AdminEmail,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<StatisticsModel> countAll = <StatisticsModel>[];
            for (Map<String, dynamic> countAllParkModel
                in commonResponse.data!['result']) {
              countAll.add(StatisticsModel.fromJson(countAllParkModel));
            }
            return  Right(countAll);
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
