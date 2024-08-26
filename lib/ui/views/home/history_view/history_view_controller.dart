import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/data/models/api/problem_model.dart';
import 'package:car_medic/core/data/repositories/park_repositories.dart';
import 'package:car_medic/core/data/repositories/problem_repostitories.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import 'package:get/get.dart';

class HistoryViewController extends BaseController {
  int index = 0;
  List<ParkingHistoryModel>? parkingHistory;
  List<ProblemHistoryModel>? problemHistory;

  handleClickFilter({required int serviceIndex}) {
    currentIndexON.value = -1;
    showText.value = false;
    index = serviceIndex;
    update();
  }

  RxInt currentIndexON = (-1).obs;
  RxBool showText = false.obs;

  void clickToShow(int index) {
    if (index == currentIndexON.value) {
      currentIndexON.value = -1;
      showText.value = false;
    } else {
      currentIndexON.value = index;
      showText.value = true;
    }
  }

  bool checkExpandedContainer(int index) {
    if (currentIndexON.value == index && showText.value == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getHistoryParking() async {
    await runLoadingFutureFunction(
        function: ParkRepository().getHistoryParking().then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) {
            currentIndexON.value = -1;
            showText.value = false;
            parkingHistory = null;
            parkingHistory = r;
            for (int i = 0; i < parkingHistory!.length; i++) {
              parkingHistory![i].createdAt =
                  parkingHistory![i].createdAt!.substring(0, 10);
            }
            update();
          });
        }));
  }

  Future<void> getHistoryProblems() async {
    await runLoadingFutureFunction(
        function: ProblemRepositories().getHistoryProblem().then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) {
            currentIndexON.value = -1;
            showText.value = false;
            problemHistory = null;
            problemHistory = r;
            for (int i = 0; i < problemHistory!.length; i++) {
              problemHistory![i].createdAt =
                  problemHistory![i].createdAt!.substring(0, 10);
            }

            update();
          });
        }));
  }

  Future<void> deleteHistoryPark({required String idPark}) async {
    await runLoadingFutureFunction(
        function:
        ParkRepository().deleteHistoryPark(idPark: idPark).then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) async {
            CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
            await getHistoryParking();
          });
        }));
  }
  Future<void> deleteHistoryProblem({required String idPark}) async {
    await runLoadingFutureFunction(
        function:
        ProblemRepositories().deleteHistoryProblem(idPark: idPark).then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) async {
            CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
            await getHistoryProblems();
          });
        }));
  }

  @override
  Future<void> onInit() async {
    getHistoryParking();
    getHistoryProblems();
    super.onInit();
  }
}
