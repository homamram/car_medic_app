import 'dart:async';
import 'package:car_medic/core/data/models/api/amin_info_model.dart';
import 'package:car_medic/core/data/repositories/admin_repositories.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_medic/ui/views/home/profile_view/profile_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminProfileController extends BaseController {
  List<String> parks = [];
  RxString parkname = 'total'.obs;
  List<AdminParks>? adminparks;
  RxList<bool> expandedContainer = [false, false].obs;
  AdminInfo admin = AdminInfo();
  ImagePicker picker = ImagePicker();
  FileModel selectedFile = FileModel('', FileTypeEnum.GALLERY);
  bool showOptions = false;

  TextEditingController name = TextEditingController();
  TextEditingController newParkinNmae = TextEditingController();
  TextEditingController newprice = TextEditingController();
  TextEditingController email = TextEditingController();

  clickToExpanded({required int index}) {
    expandedContainer[index] = !expandedContainer[index];
  }

  @override
  void onInit() async {
    await getParking();
    admin = storage.getAdminInfo()!;
    name = TextEditingController(text: admin.username);
    email = TextEditingController(text: admin.email);
    selectedFile.path = storage.getGallary;
    update();
    super.onInit();
  }

  void setShowOPtion(bool value) {
    showOptions = value;
    update();
  }

  Future<FileModel> pickFile(FileTypeEnum type) async {
    String path = '';
    switch (type) {
      case FileTypeEnum.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOPtion(false);
    return FileModel(path.isNotEmpty ? path : selectedFile.path,
        path.isNotEmpty ? type : selectedFile.type);
  }

  Future<void> getParking() async {
    await runLoadingFutureFunction(
        function: AdminRepositories().getAdminParks().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        adminparks = r;
        r.forEach((parking) {
          parks.add(parking.location!.parkingName!);
        });
        parks.add('All');
        update();
      });
    }));
  }

  Future<void> editepark({
    required String ParkingName,
    required int Price,
  }) async {
    await runFullLoadingFutureFunction(
        function: AdminRepositories()
            .updatepark(
                AdminEmail: admin.email.toString(),
                parkingName: ParkingName,
                newParkingName: newParkinNmae.text,
                Price: Price,
                newPrice: int.parse(newprice.text))
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
      });
    }));
  }

  Future<void> setting() async {
    await runFullLoadingFutureFunction(
        function: AdminRepositories()
            .settigns(
                AdminEmail: admin.email.toString(),
                newAdminEmail: email.text,
                username: admin.username.toString(),
                newusername: name.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        admin = storage.getAdminInfo()!;
        update();
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
      });
    }));
  }
}
