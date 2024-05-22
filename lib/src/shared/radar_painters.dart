
import 'package:flutter/cupertino.dart';

import '../res/colors.dart';

class RadarPainter extends CustomPainter {
  final double scale;

  RadarPainter(this.scale);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = MarbleColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2.6;

    final radius = maxRadius * (scale);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RadarPainter2 extends CustomPainter {
  final double scale;

  RadarPainter2(this.scale);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = MarbleColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    final radius = maxRadius * (scale);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}