import 'dart:developer';
import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/data/network/endpoints/park_endpoint.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:dartz/dartz.dart';
import 'package:car_medic/core/data/models/common_respons.dart';
import 'package:car_medic/core/data/network/network_config.dart';
import 'package:car_medic/core/enums/request_type.dart';
import 'package:car_medic/core/utils/network_utils.dart';

class ParkRepository {
  Future<Either<String, List<ChooseParkingModel>>> getClosestPark({
    required String lat,
    required String long,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.getClosestPark,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
          body: {
            'userLatitude': lat,
            'userLongitude': long,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            List<ChooseParkingModel> listParking = [];
            for (Map<String, dynamic> parkingModel
                in commonResponse.data!['parkingLocations']) {
              listParking.add(ChooseParkingModel.fromJson(parkingModel));
            }
            return Right(listParking);
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

  Future<Either<String, dynamic>> choosePark({
    required String ParkingNumber,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.choosePark,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
          body: {

            'ParkingNumber': ParkingNumber,
            'username': storage.getUserInfo()!.username,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(commonResponse.data);
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

  Future<Either<String, parkingorderdetails>> chooseTimeSpot({
    required int duration,
    required String date,
    required int Spot,
    required String parkingName,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.chooseTime,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
          body: {
            'username': storage.getUserInfo()!.username,
            'duration': duration,
            'date': date,
            'parkingName': parkingName,
            'Spot': Spot,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(parkingorderdetails.fromJson(commonResponse.data!));
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

  //-----------------------------------------------------------------
  Future<Either<String, ParkingTimer>> parkingtimer() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.parkingtimer,
          headers:
              NetworkConfig.getHeaders(needAuth: true, type: RequestType.POST),
          body: {
            'username': storage.getUserInfo()!.username,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(ParkingTimer.fromJson(commonResponse.data!));
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

  Future<Either<String, String>> expandtime({
    required int duration,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.expandtime,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'username': storage.getUserInfo()!.username,
            'duration': duration,
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

  Future<Either<String, List<ParkingHistoryModel>>> getHistoryParking() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.getHistoryParking,
          headers: NetworkConfig.getHeaders(type: RequestType.POST,needAuth: true),
          body: {
            'username': storage.getUserInfo()!.username,
          }).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<List<dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<ParkingHistoryModel> historyParking = [];
            for (Map<String, dynamic> s in commonResponse.data!) {
              historyParking.add(ParkingHistoryModel.fromJson(s));
            }
            return Right(historyParking);
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

  Future<Either<String, String>> deleteHistoryPark(
      {required String idPark}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.deleteHistoryPark,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {"id": idPark}).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(commonResponse.data!['messgae']);
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

  Future<Either<String, List<dynamic>>> chooseQRPark({
    required String parkName,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.chooseQRPark,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'ParkingNumber': parkName,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<dynamic> order = [];
            order.add(commonResponse.data!['ParkingName']);
            order.add(commonResponse.data!['spot']);
            order.add(commonResponse.data!['Price']);

            return Right(order);
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


  Future<Either<String, String>> ordercansling() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ParkEndPoints.oedercansled,
          headers:
          NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'email': storage.getUserInfo()!.email,
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


}
