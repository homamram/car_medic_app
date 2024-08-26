// import 'package:animate_do/animate_do.dart';
// import 'package:car_medic/ui/admin_view/add_park/add_park_controller.dart';
// import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_widget/custom_appbar_admin.dart';
// import 'package:car_medic/ui/shared/extension_sizebox.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../core/translation/app_translation.dart';
// import '../../../core/utils/general_util.dart';
// import '../../shared/colors.dart';
// import '../../shared/custom_widget/custom_button.dart';
// import '../../shared/custom_widget/custom_text_field.dart';
//
// class AddParkView extends StatelessWidget {
//   AddParkView({super.key});
//
//   AddParkController controller = Get.put(AddParkController());
//   final GlobalKey<FormState> _formKey = GlobalKey(debugLabel: 'addparkscreen');
//
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: AppColors.whiteColor,
//         appBar: AppBarCustom(
//           title: 'New Park',
//         ),
//         body: Column(
//           children: [
//             (20.h).ph,
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal: defaultPadding),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       (15.h).ph,
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 100),
//                         duration: const Duration(milliseconds: 300),
//                         child: CustomTextFormField(
//                           readOnly: true,
//                           hintText: '',
//                           controller: controller.emailController,
//                         ),
//                       ),
//                       (25.h).ph,
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 400),
//                         duration: const Duration(milliseconds: 300),
//                         child: CustomTextFormField(
//                           hintText: "parkingName",
//                           controller: controller.parkingName,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return tr('Should be empty');
//                             }
//
//                             return null;
//                           },
//                         ),
//                       ),
//                       (25.h).ph,
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 700),
//                         duration: const Duration(milliseconds: 300),
//                         child: CustomTextFormField(
//                           keyboardType: TextInputType.number,
//                           hintText: "NumberOfCarRepairPlaces",
//                           controller: controller.NumberOfCarRepairPlaces,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return tr('Should be empty');
//                             }
//
//                             return null;
//                           },
//                         ),
//                       ),
//                       (25.h).ph,
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 1000),
//                         duration: const Duration(milliseconds: 300),
//                         child: CustomTextFormField(
//                           keyboardType: TextInputType.number,
//                           hintText: "price",
//                           controller: controller.price,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return tr('Should be empty');
//                             }
//
//                             return null;
//                           },
//                         ),
//                       ),
//                       (25.h).ph,
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 1300),
//                         duration: const Duration(milliseconds: 300),
//                         child: CustomTextFormField(
//                           keyboardType: TextInputType.number,
//                           hintText: "lattidude",
//                           controller: controller.late,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return tr('Should be empty');
//                             }
//
//                             return null;
//                           },
//                         ),
//                       ),
//                       (25.h).ph,
//                       FadeInLeft(
//                         delay: const Duration(milliseconds: 1600),
//                         duration: const Duration(milliseconds: 300),
//                         child: CustomTextFormField(
//                           keyboardType: TextInputType.number,
//                           hintText: "longtidude",
//                           controller: controller.long,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return tr('Should be empty');
//                             }
//
//                             return null;
//                           },
//                         ),
//                       ),
//                       (25.h).ph,
//                       ZoomIn(
//                         delay: const Duration(milliseconds: 1900),
//                         duration: const Duration(milliseconds: 300),
//                         child: CustomButton(
//                           width: 1.sw,
//                           height: 50.h,
//                           buttonTypeEnum: ButtonTypeEnum.normal,
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                               await controller.addpark();
//                             }
//                           },
//                           text: "Add Park ",
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
