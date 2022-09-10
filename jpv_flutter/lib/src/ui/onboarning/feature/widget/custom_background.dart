import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomBackground extends CustomPainter {
  CustomBackground();

  double width = 0;
  double height = 0;
  @override
  void paint(Canvas canvas, Size size) {
    width = size.width;
    final widthItem = size.width / 3;
    height = size.height;
    final paint = Paint();

    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 4;
    paint.shader = ui.Gradient.linear(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), const [
      Color(0xffF52C6A),
      Color(0xffF72D6B),
    ]);

    final path = Path();

    // final segmentWidth = width * 0.5;

    path.moveTo(width * .04, height * 0.45);
    path.quadraticBezierTo(
      widthItem * 0.25, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.58, //EL ANGULO
      widthItem * 0.5, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.4, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      widthItem * 0.7, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.22, //EL ANGULO
      widthItem * 0.78, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.3, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      widthItem * 0.8, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.4, //EL ANGULO
      widthItem, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.5, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      ((widthItem * 2) * 0.75), //DONDE VA A INTENTAR HACER LA CURVA

      height * 0.73, //EL ANGULO
      widthItem * 2, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.5, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      width * 0.8, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.25, //EL ANGULO
      width * .85, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.4, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      width * 0.87, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.5, //EL ANGULO
      width * .92, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.5, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      width * 1, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.5, //EL ANGULO
      width * .95, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.35, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      width * 0.9, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.2, //EL ANGULO
      width * .8, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.15, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      width * 0.72, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.12, //EL ANGULO
      widthItem * 2, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.2, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      widthItem * 1.9, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.24, //EL ANGULO
      widthItem * 1.86, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.28, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      widthItem * 1.5, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.6, //EL ANGULO
      widthItem * 1.14, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.28, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      widthItem * 1.1, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.24, //EL ANGULO
      widthItem, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.2, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      widthItem * 0.7, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.1, //EL ANGULO
      widthItem * 0.4, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      height * 0.2, //DESDE ARRIBA A DONDE LLEGA
    );

    path.quadraticBezierTo(
      widthItem * 0.05, //DONDE VA A INTENTAR HACER LA CURVA
      height * 0.33, //EL ANGULO
      width * .04,
      height * 0.45,
    );

    canvas.drawShadow(path, const Color(0xffF52C6A), 30, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
