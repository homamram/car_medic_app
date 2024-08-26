import 'dart:async';
import 'package:car_medic/core/data/models/api/user_info_model.dart';
import 'package:car_medic/core/data/repositories/user_repositories.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_medic/ui/views/home/profile_view/profile_view.dart';
import 'package:car_medic/ui/views/main_view/main_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends BaseController {
  RxList<bool> expandedContainer = [false, false].obs;
  UserInfo userInfo = UserInfo();
  ImagePicker picker = ImagePicker();
  FileModel selectedFile = FileModel('', FileTypeEnum.GALLERY);
  bool showOptions = false;
  RxBool showIcons = false.obs;
  RxBool expandContainer = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController carNumber = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController carType = TextEditingController();

  clickToExpanded({required int index}) {
    expandedContainer[index] = !expandedContainer[index];
  }

  List proInfo = <String>[];

  Future<void> getPro() async {
    await UserRepository().pro().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        proInfo = r;
        print(proInfo[0]);
        update();
      });
    });
  }

  @override
  void onInit() async {
    userInfo = storage.getUserInfo()!;
    name = TextEditingController(text: userInfo.firstName);
    lastName = TextEditingController(text: userInfo.lastName);
    email = TextEditingController(text: userInfo.email);
    carNumber = TextEditingController(text: userInfo.car!.carNumber);
    carType = TextEditingController(text: userInfo.car!.carType);
    carModel = TextEditingController(text: userInfo.car!.carModel);
    selectedFile.path = storage.getGallary;
    await getPro();
    update();
    super.onInit();
  }

  Future<void> editProfile() async {
    await runFullLoadingFutureFunction(
        function: UserRepository()
            .editProfile(
                lastName: lastName.text,
                firstName: name.text,
                carNumber: carNumber.text,
                carModel: carModel.text,
                carType: carType.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
        userInfo.firstName = name.text;
        userInfo.username = name.text;
        userInfo.lastName = lastName.text;
        userInfo.car!.carModel = carModel.text;
        userInfo.car!.carNumber = carNumber.text;
        userInfo.car!.carType = carType.text;
        storage.setUserInfo(userInfo);
        Get.back();
      });
    }));
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
}
