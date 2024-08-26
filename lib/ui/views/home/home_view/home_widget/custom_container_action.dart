// import 'package:car_medic/ui/shared/colors.dart';
// import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
// import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
// import 'package:car_medic/ui/shared/extension_sizebox.dart';
// import 'package:car_medic/ui/views/home/home_view/home_view_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// class CustomContainerAction extends StatelessWidget {
//  const CustomContainerAction(
//       {super.key, required this.action, this.price, this.time});
//
//   final HomeAction action;
//   final String? price;
//   final String? time;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
//         padding:
//             EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 15.w),
//         width: 350.sw,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(25.r)),
//             // color: AppColors.secondGray
//             color: const Color(0xFFD1D1D1)
//             ),
//         child: Row(
//           children: [
//             SvgPicture.asset('assets/images/home_${action.image}.svg'),
//             Padding(
//               padding: EdgeInsetsDirectional.only(start: 20.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: action.listText![0],
//                     textType: TextStyleType.subtitle,
//                     textColor: AppColors.blackColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   (10.h).ph,
//                   if (action.image == 'pay') ...[
//                     SizedBox(
//                       width: 200.w,
//                       child: Row(
//                         children: [
//                           CustomText(
//                               text: action.listText![1],
//                               textType: TextStyleType.bodyBig),
//                           CustomText(
//                               text: '$price SYP',
//                               textType: TextStyleType.bodyBig),
//                         ],
//                       ),
//                     ),
//                     (10.h).ph,
//                   ],
//                   CustomText(
//                       startPadding: action.image == 'time' ? 100.w : 0,
//                       text: action.image == 'pay'
//                           ? action.listText![2]
//                           : (action.image == 'time'
//                               ? time ?? 'No Service'
//                               : action.listText![1]),
//                       textType: TextStyleType.bodyBig),
//                 ],
//               ),
//             ),
//             if (action.image == 'pay') ...[
//               const Spacer(),
//               CustomButton(
//                   text: action.textBottom!,
//                   buttonTypeEnum: ButtonTypeEnum.small)
//             ]
//           ],
//         ));
//   }
// }
