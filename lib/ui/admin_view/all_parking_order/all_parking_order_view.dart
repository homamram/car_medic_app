import 'package:car_medic/ui/admin_view/all_parking_order/custom_table.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'all_parking_controller.dart';

class AllParkingOrder extends StatefulWidget {
  const AllParkingOrder({Key? key}) : super(key: key);
  @override
  State<AllParkingOrder> createState() => _AllParkingOrderState();
}

class _AllParkingOrderState extends State<AllParkingOrder> {
  @override

  Widget build(BuildContext context) {
    return GetBuilder<AllParkingController>(
      init: AllParkingController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            
            backgroundColor: Colors.white,
            body: Column(
              children: [
                CustomAppBar(title: "Parking Order Description"),
                (20.w).ph,
                CustomTable(),
              ],
            ),
          ),
        );
      },
    );
  }

}
