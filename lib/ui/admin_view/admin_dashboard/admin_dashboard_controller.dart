import 'package:car_medic/core/data/models/api/Statiscs_model.dart';
import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/data/models/api/problem_model.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/admin_view/all_order_detiels/all_order_view.dart';
import 'package:car_medic/ui/admin_view/all_parking_order/all_parking_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/repositories/admin_repositories.dart';
import '../../../core/enums/message_type.dart';
import '../../shared/custom_widget/custom_toast.dart';

class AdminDashboardController extends GetxController {
  String messageNoOrder = '';

  // List<TotalRevenue>? totalRevenuelist;
  // List<NumberofLocationbyPark>? numberOfLocation;
  List<String> parksCount = <String>[];
  List<String> parksRevenue = <String>[];
  List<String> repairOrderCount = <String>[];
  String parkNameTotalPark = 'All';
  String parkNameTotalRevenue = 'All';
  String parkNameTotalOrder = '';
  RxList<SocketPark> allorderparking = <SocketPark>[].obs;
  List<ProblemHistoryModel> problemHistory = <ProblemHistoryModel>[];

  List<StatisticsModel> parkCount = <StatisticsModel>[];
  List<StatisticsModel> repairOrdersCount = <StatisticsModel>[];
  List<StatisticsModel> parkRevenue = <StatisticsModel>[];
  List<String> titleAction = [
    'Park Status',
    'Orders',
  ];
  List<Color> colorsBar = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.tealAccent,
    Colors.yellow,
    Colors.orange,
    Colors.grey
  ];

  handleClickAction({required int index}) {
    if (index == 0) {
      Get.to(() => const AllParkingOrder());
    } else if (index == 1) {
      Get.to(() => const AllOrderView());
    }
  }

  Future onRefresh() async {
    await getHistoryProblems();
    await handleRefresh();
  }

  @override
  void onInit() async {
    connectSocket();
    await getHistoryProblems();
    await getCountALlParks();
    parkNameTotalOrder = parksCount[1];
    update();

    await getTotalRevenueParks();
    await getRepairOrdersByProblem(parkingname: parksCount[0]);
    super.onInit();
  }

  Future<void> getHistoryProblems() async {
    await AdminRepositories().getHistoryProblem().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        problemHistory = r;
        for (int i = 0; i < problemHistory.length; i++) {
          problemHistory[i].createdAt =
              problemHistory[i].createdAt!.substring(0, 10);
        }
        update();
      });
    });
  }

  Future handleRefresh() async {
    if (parkNameTotalPark == 'All') {
      await getCountALlParks();
    } else {
      await getNumberOfLocationByPark(parkingname: parkNameTotalPark);
    }
    if (parkNameTotalRevenue == 'All') {
      await getTotalRevenueParks();
    } else {
      await getTotalRevenueByPark(parkingname: parkNameTotalRevenue);
    }
    getRepairOrdersByProblem(parkingname: parkNameTotalOrder);
  }

  Future<void> getCountALlParks() async {
    await AdminRepositories()
        .getCountAllPark(AdminEmail: storage.getAdminInfo()!.email!)
        .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        parkCount.clear();
        parkCount = r;
        for (int i = 0; i < problemHistory.length; i++) {
          problemHistory[i].createdAt =
              problemHistory[i].createdAt!.substring(0, 10);
        }
        if (parksCount.isEmpty && parksRevenue.isEmpty) {
          parksCount.clear();
          parksRevenue.clear();
          repairOrderCount.clear();
          r.forEach((parking) {
            parksCount.add(parking.name!);
            parksRevenue.add(parking.name!);
            repairOrderCount.add(parking.name!);
          });
          parksCount.add(tr('All'));
          parksRevenue.add(tr('All'));
        }

        update();
      });
    });
  }

  Future<void> getTotalRevenueParks() async {
    AdminRepositories().totalRevenue().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        parkRevenue.clear();
        update();
        parkRevenue = r;
        update();
      });
    });
  }

  Future<void> getNumberOfLocationByPark({
    required String parkingname,
  }) async {
    AdminRepositories()
        .numberofLocation(parkingname: parkingname)
        .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        parkCount.clear();
        update();
        parkCount = r;
        update();
      });
    });
  }

  Future<void> getTotalRevenueByPark({
    required String parkingname,
  }) async {
    AdminRepositories()
        .totalrevenuebypark(parkingname: parkingname)
        .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        parkRevenue.clear();
        update();
        parkRevenue = r;
        update();
      });
    });
  }

  Future<void> getRepairOrdersByProblem({
    required String parkingname,
  }) async {
    AdminRepositories()
        .repairordersbyproblem(parkingname: parkingname)
        .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        repairOrdersCount.clear();
        update();
        repairOrdersCount = r;
        update();
      });
    });
  }

  void connectSocket() async {
    if (!socket.connected) {
      socket.auth = {
        'user_id': storage.getAdminInfo()!.sId,
        'username': storage.getAdminInfo()!.username,
      };
      socket.connect();
      socket.emit('auth', {
        'username': storage.getAdminInfo()!.username,
      });
      socket.on('getall', (message) {
        if (message is String) {
          messageNoOrder = message;
        } else {
          print(message);
          for (Map<String, dynamic> s in message) {
            allorderparking.add(SocketPark.fromJson(s));
          }
          print(allorderparking[0].userId!.firstName);
        }
        update();
      });
      socket.on('add', (message) {
        List<SocketPark> reverst = [];
        reverst.add(SocketPark.fromJson(message));
        reverst.addAll(allorderparking);
        allorderparking.clear();
        allorderparking.addAll(reverst);
        update();
        print('add');
      });
    }
  }
}
