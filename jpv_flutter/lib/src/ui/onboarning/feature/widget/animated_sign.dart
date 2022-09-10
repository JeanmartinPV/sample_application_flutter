import 'package:flutter/material.dart';

class AnimatedSign extends CustomPainter {
  AnimatedSign({
    required this.valueLineAnimated,
    required this.step,
  });
  final double valueLineAnimated;
  double valueAnimated(double value) => value * valueLineAnimated;

  final int step;
  @override
  void paint(Canvas canvas, Size size) {
    final paintSign = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    final path3 = Path();

    if (step == 0) {
      path3.moveTo(size.width * 0.25, 0);
      path3.lineTo(size.width * 0.75, size.height * 0.5);
      path3.lineTo(size.width * 0.25, size.height);

      canvas.drawPath(path3, paintSign);
    } else if (step == 1) {
      path3.moveTo(
        size.width * 0.25,
        0 - ((size.height * 0.2) * valueLineAnimated),
      );
      path3.lineTo(
        size.width * 0.75,
        (size.height * 0.5) - ((size.height * 0.2) * valueLineAnimated),
      );
      path3.lineTo(
        size.width * 0.25,
        size.height - ((size.height * 0.2) * valueLineAnimated),
      );

      canvas.drawPath(path3, paintSign);
    } else if (step == 2) {
      path3.moveTo(size.width * 0.25, size.height * -0.2);
      path3.lineTo(size.width * 0.75, (size.height * 0.3));
      path3.lineTo(size.width * 0.25, size.height * 0.8);

      canvas.drawPath(path3, paintSign);
    } else if (step == 3) {
      path3.moveTo(
        size.width * (0.25 - valueAnimated(0.95)), //-0.7
        size.height * (-0.2 - valueAnimated(0.1)), // -0.3,
      );
      path3.lineTo(
        size.width * (0.75 - valueAnimated(0.15)), // 0.60,
        size.height * (0.3 + valueAnimated(0.2)), // 0.5,
      );
      path3.lineTo(
        size.width * (0.25 - valueAnimated(0.15)), // 0.1,
        size.height * (0.8 + valueAnimated(0.2)), //1.0
      );

      canvas.drawPath(path3, paintSign);
    } else if (step == 4) {
      const valueMove = 0.3;
      path3.moveTo(
        size.width * (-0.7 + valueAnimated(valueMove)), //-0.3
        size.height * -0.3,
      );
      path3.lineTo(
        size.width * (0.6 + valueAnimated(valueMove)), // 1,
        size.height * 0.5,
      );
      path3.lineTo(
        size.width * (0.1 + valueAnimated(valueMove)), //0.5
        size.height,
      );

      canvas.drawPath(path3, paintSign);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
