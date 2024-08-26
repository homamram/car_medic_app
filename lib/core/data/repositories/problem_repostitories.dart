import 'dart:developer';
import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/data/models/api/problem_model.dart';
import 'package:car_medic/core/data/network/endpoints/problem_endpoint.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:dartz/dartz.dart';
import 'package:car_medic/core/data/models/common_respons.dart';
import 'package:car_medic/core/data/network/network_config.dart';
import 'package:car_medic/core/enums/request_type.dart';
import 'package:car_medic/core/utils/network_utils.dart';

class ProblemRepositories {
  Future<Either<String, List<ProblemModel>>> chooseProblemType({
    required String problemType,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ProblemEndpoint.chooseProblemType,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'ProblemType': problemType,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<ProblemModel> listProblems = [];
            for (Map<String, dynamic> problems in commonResponse.data!) {
              listProblems.add(ProblemModel.fromJson(problems));
            }
            return Right(listProblems);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ChooseParkingModel>>> getRepairPlaces({
    required String userLatitude,
    required String userLongitude,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ProblemEndpoint.getRepairPlaces,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'userLatitude': userLatitude,
            'userLongitude': userLongitude,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<ChooseParkingModel> listPlacing = [];
            for (Map<String, dynamic> parkingModel
                in commonResponse.data!['parkingLocations']) {
              listPlacing.add(ChooseParkingModel.fromJson(parkingModel));
            }
            return Right(listPlacing);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, OrderDetailsModel>> choosePlace({
    required String parkNumber,
    required String problem,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ProblemEndpoint.choosePlace,
          headers: NetworkConfig.getHeaders(type: RequestType.POST),
          body: {
            'parkNumber': parkNumber,
            'Problem': problem,
            'userName': storage.getUserInfo()!.username,
          }).then((response) {
        if (response != null) {
          log('==========> ${response}');
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(OrderDetailsModel.fromJson(commonResponse.data));
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProblemHistoryModel>>> getHistoryProblem() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ProblemEndpoint.getHistoryProblem,
          headers: NetworkConfig.getHeaders(type: RequestType.POST,needAuth: true),
          body: {
            'username': storage.getUserInfo()!.username,
          }).then((response) {
        if (response != null) {
          log('==========> $response');
          CommonResponse<dynamic> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            List<ProblemHistoryModel> historyProblem = [];
            for (Map<String, dynamic> s in commonResponse.data!) {
              historyProblem.add(ProblemHistoryModel.fromJson(s));
            }
            return Right(historyProblem);
          } else {
            return Left(commonResponse.message ?? '');
          }
        } else {
          return Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> deleteHistoryProblem(
      {required String idPark}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: ProblemEndpoint.deleteHistoryProblem,
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
          return Left(tr('Please check your internet'));
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
