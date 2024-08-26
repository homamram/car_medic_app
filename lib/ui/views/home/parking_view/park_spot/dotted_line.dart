import 'package:car_medic/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.mainColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    int dashWidth = 7; // عرض النقطة
    int dashSpace = 7; // المسافة بين النقاط

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) => false;
}