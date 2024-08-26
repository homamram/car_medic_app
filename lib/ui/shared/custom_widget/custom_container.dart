import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.child,
      this.backgroundColor,
      this.borderSide,
      this.width,
      this.height,
      this.colorShadow,
      this.isShadow,
      this.paddingTop,
      this.paddingLeft,
      this.paddingRight,
      this.paddingBottom,
      this.gradient,
      this.gr,
      this.paddingContent,
      this.boxShadow,
      this.borderRadius,
      this.decorationImage,
      this.existBorderRadius,
      this.boxBorder});

  final Widget? child;
  final Color? backgroundColor;
  final Color? colorShadow;
  final Gradient? gradient;
  final BorderRadiusDirectional? borderSide;
  final BoxBorder? boxBorder;
  final double? width;
  final bool? isShadow;
  final bool? gr;
  final DecorationImage? decorationImage;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsDirectional? paddingContent;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final List<BoxShadow>? boxShadow;
  final bool? existBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: paddingTop ?? 0,
          bottom: paddingBottom ?? 0,
          start: paddingLeft ?? 0,
          end: paddingRight ?? 0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutSine,
        padding: paddingContent,
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: gradient,
          image: decorationImage,
          border: boxBorder,
          borderRadius: existBorderRadius ?? true
              ? (borderSide ?? BorderRadius.circular(borderRadius ?? 15.r))
              : null,
          color:
              decorationImage != null || gradient != null ? null : Colors.white,
          boxShadow: isShadow ?? true
              ? boxShadow ??
                  [
                    BoxShadow(
                      color: colorShadow ?? Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ]
              : null,
        ),
        child: child,
      ),
    );
  }
}
