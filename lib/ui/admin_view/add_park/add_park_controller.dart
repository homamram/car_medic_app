// import 'dart:developer';
//
// import 'package:car_medic/core/data/repositories/admin_repositories.dart';
// import 'package:car_medic/core/data/repositories/user_repositories.dart';
// import 'package:car_medic/core/enums/message_type.dart';
// import 'package:car_medic/core/services/base_controller.dart';
// import 'package:car_medic/core/utils/general_util.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../shared/custom_widget/custom_toast.dart';
//
// class AddParkController extends BaseController {
//   TextEditingController emailController =
//       TextEditingController(text: storage.getAdminInfo()!.email);
//   TextEditingController parkingName = TextEditingController();
//   TextEditingController late = TextEditingController();
//
//   TextEditingController long = TextEditingController();
//
//   TextEditingController firstNameController = TextEditingController();
//
//   TextEditingController NumberOfCarRepairPlaces = TextEditingController();
//
//   TextEditingController price = TextEditingController();
//
//   Future<void> addpark() async {
//     await runFullLoadingFutureFunction(
//         function: AdminRepositories()
//             .AddPark(
//                 AdminEmail: emailController.text,
//                 price: int.parse(price.text),
//                 NumberOfCarRepairPlaces:
//                     int.parse(NumberOfCarRepairPlaces.text),
//                 lat: double.parse(late.text),
//                 long: double.parse(late.text),
//                 parkingName: parkingName.text)
//             .then((value) {
//       value.fold((l) {
//         CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
//       }, (r) async {
//         CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
//         Get.back();
//
//         update();
//       });
//     }));
//   }
// }
