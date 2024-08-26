import 'dart:math';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/views/home/home_view/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer' as d;

showQrScanner() {
  HomeViewController controller = Get.find();
  showGeneralDialog(
    barrierLabel: '',
    barrierDismissible: true,
    context: Get.context!,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, anim1, anim2) {
      return AnimatedPadding(
        padding: EdgeInsets.zero,
        duration: Duration.zero,
        child: MediaQuery.removeViewInsets(
          removeLeft: true,
          removeTop: true,
          removeRight: true,
          removeBottom: true,
          context: context,
          child: Align(
            alignment: Alignment.center,
            child: Material(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColors.mainColor,
              child: SizedBox(
                height: 430.w,
                width: 430.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 430.w,
                      height: 430.w,
                      decoration: BoxDecoration(
                        color: AppColors.grayColor,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: AppColors.mainColor,
                          width: 2,
                        ),
                      ),
                      child: QRView(
                        key: GlobalKey(),
                        onQRViewCreated: (ctrl) async {
                          d.log(name: "qr", "start");
                          ctrl.scannedDataStream.listen((event) async {
                            try {
                              controller.qrParkChoose = event.code!;
                              await controller.chooseQRPark();
                              ctrl.pauseCamera();
                              Get.back();
                              d.log(name: "qr", event.code!);
                              // await readQrController
                              //     .getQrData(event.code.toString());
                            } catch (e) {
                              ctrl.resumeCamera();
                            }
                          });
                        },
                        // scanLineColor: AppColors.error,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image(
                        width: 120.w,
                        height: 120.w,
                        image: const AssetImage('assets/images/corner.png'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Transform(
                        origin: Offset(60.w, 10.w),
                        transform: Matrix4.rotationZ(pi)..rotateX(pi),
                        child: Image(
                          width: 120.w,
                          height: 120.w,
                          image: const AssetImage('assets/images/corner.png'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Transform(
                        // alignment: Alignment.bottomLeft,
                        origin: Offset(59.w, 61.w),
                        transform: Matrix4.rotationZ(pi),
                        child: Image(
                          width: 120.w,
                          height: 120.w,
                          image: const AssetImage('assets/images/corner.png'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Transform(
                        origin: Offset(59.w, 62.w),
                        transform: Matrix4.rotationZ(pi / 2),
                        child: Image(
                          width: 120.w,
                          height: 120.w,
                          image: const AssetImage('assets/images/corner.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
