import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CircleAnimated extends CustomPainter {
  CircleAnimated({
    required this.valueOvalAnimated,
    required this.valueLineAnimated,
    required this.stroke,
    required this.step,
    required this.widthOvalLine,
    required this.widthLine,
  });
  final double valueOvalAnimated;
  final double valueLineAnimated;
  final double widthOvalLine;
  final double widthLine;
  final int step;

  double valueAnimated(double value) => value * valueOvalAnimated;

  Offset moveTo(int step) {
    late final Offset offSetMoveTo;
    if (step == 0) {
      offSetMoveTo = Offset(
        width * 0.45,
        height * .1,
      );
    } else if (step == 1) {
      offSetMoveTo = Offset(
        width * (0.45 + (0.05 * valueOvalAnimated)),
        height * (0.1 - (0.02 * valueOvalAnimated)),
      );
    } else if (step == 2) {
      offSetMoveTo = Offset(
        width * (0.5 + (0.05 * valueOvalAnimated)),
        height * (.08 - (0.04 * valueOvalAnimated)),
      );
    } else if (step == 3) {
      offSetMoveTo = Offset(
        width * (0.55 - valueAnimated(0.05)), //0.5
        height * (.04), //0.04
      );
    } else if (step == 4) {
      offSetMoveTo = Offset(
        width * (0.50 - valueAnimated(0.05)), //0.5
        height * (.04 + valueAnimated(0.02)), //0.04
      );
    }

    return offSetMoveTo;
  }

  List<Offset> curve1(int step) {
    late final List<Offset> listCurve;
    if (step == 0) {
      listCurve = [
        Offset(width * 1.1, height * 0.2),
        Offset(width * 0.95, height * 0.7),
      ];
    } else if (step == 1) {
      listCurve = [
        Offset(
          width * (1.1 + (0.05 * valueOvalAnimated)),
          height * (0.2 - (0.08 * valueOvalAnimated)),
        ),
        Offset(
          width * (0.95 - (0.05 * valueOvalAnimated)),
          height * (0.7 - (0.1 * valueOvalAnimated)),
        ),
      ];
    } else if (step == 2) {
      listCurve = [
        Offset(
          width * (1.13 - (0.13 * valueOvalAnimated)),
          height * (0.15 - (0.149 * valueOvalAnimated)),
        ),
        Offset(
          width * (0.90 + (0.05 * valueOvalAnimated)),
          height * (0.65 - (0.10 * valueOvalAnimated)), //0.55
        ),
      ];
    } else if (step == 3) {
      listCurve = [
        Offset(
          width * (1 - valueAnimated(0.05)),
          height * (0.001 + valueAnimated(0.049)),
        ),
        Offset(
          width * (0.95), //0.95
          height * (0.55 - valueAnimated(0.05)), //0.55
        ),
      ];
    } else if (step == 4) {
      listCurve = [
        Offset(
          width * (0.95 - valueAnimated(0.05)),
          height * (0.05 + valueAnimated(0.09)),
        ),
        Offset(
          width * (0.95), //0.95
          height * (0.50 - valueAnimated(0.05)), //0.45
        ),
      ];
    }

    return listCurve;
  }

  List<Offset> curve2(int step) {
    late final List<Offset> listCurve;
    if (step == 0) {
      listCurve = [
        Offset(width * 0.9, height * 0.95),
        Offset(width * .5, height * 0.9),
      ];
    } else if (step == 1) {
      listCurve = [
        Offset(
          width * (0.9 - (0.12 * valueOvalAnimated)),
          height * (0.95 - (0.1 * valueOvalAnimated)),
        ),
        Offset(
          width * .5,
          height * 0.9,
        ),
      ];
    } else if (step == 2) {
      listCurve = [
        Offset(
          width * (0.78 + (0.16 * valueOvalAnimated)), //0.94
          height * (0.85 - (0.1 * valueOvalAnimated)), // 0.75
        ),
        Offset(width * .5, height * .9), //0.5, 0.9
      ];
    } else if (step == 3) {
      listCurve = [
        Offset(
          width * (0.94 + valueAnimated(0.02)), //0.96
          height * (0.75 + valueAnimated(0.15)), // 0.9
        ),
        Offset(
          width * .5, //0.5
          height * (.9 + valueAnimated(0.03)), //0.93
        ),
      ];
    } else if (step == 4) {
      listCurve = [
        Offset(
          width * (0.96 + valueAnimated(0.02)), //0.96
          height * (0.90 - valueAnimated(0.05)), // 0.9
        ),
        Offset(
          width * (.5 + valueAnimated(0.2)), //0.5
          height * (.93 - valueAnimated(0.03)), //0.93
        ),
      ];
    }

    return listCurve;
  }

  List<Offset> curve3(int step) {
    late final List<Offset> listCurve;
    if (step == 0) {
      listCurve = [
        Offset(width * .05, height * .85),
        Offset(width * .05, height * 0.5),
      ];
    } else if (step == 1) {
      listCurve = [
        Offset(
          width * (.05 + (0.05 * valueOvalAnimated)),
          height * (0.85 + (0.05 * valueOvalAnimated)),
        ),
        Offset(
          width * (.05 - (.02 * valueOvalAnimated)),
          height * (0.5 + (0.1 * valueOvalAnimated)),
        ),
      ];
    } else if (step == 2) {
      listCurve = [
        Offset(
          width * .1, //0.1
          height * (0.9 + (0.08 * valueOvalAnimated)), //0.98
        ),
        Offset(
          width * (0.03 + (0.02 * valueOvalAnimated)), //0.05
          height * (0.6 + (0.05 * valueOvalAnimated)), //0.65
        ),
      ];
    } else if (step == 3) {
      listCurve = [
        Offset(
          width * (.1 - valueAnimated(0.04)), //0.06
          height * (0.98 - valueAnimated(0.08)), //0.9
        ),
        Offset(
          width * (0.05), //0.05
          height * (0.65 - valueAnimated(0.15)), //0.5
        ),
      ];
    } else if (step == 4) {
      listCurve = [
        Offset(
          width * (.06 + valueAnimated(0.1)), //0.06
          height * (0.90 - valueAnimated(0.01)), //0.9
        ),
        Offset(
          width * (0.05 + valueAnimated(0.03)), //0.05
          height * (0.5 + valueAnimated(0.02)), //0.5
        ),
      ];
    }

    return listCurve;
  }

  List<Offset> curve4(int step) {
    late final List<Offset> listCurve;
    if (step == 0) {
      listCurve = [
        Offset(width * .05, height * .005),
        Offset(width * .45, height * 0.1),
      ];
    } else if (step == 1) {
      listCurve = [
        Offset(
          width * (.05 - (0.049 * valueOvalAnimated)),
          height * (.005 - (0.0049 * valueOvalAnimated)),
        ),
        Offset(
          width * (.45 + (0.05 * valueOvalAnimated)),
          height * (0.1 - (0.02 * valueOvalAnimated)),
        ),
      ];
    } else if (step == 2) {
      listCurve = [
        Offset(
          width * .001, //0.001
          height * (.0001 + (0.0499 * valueOvalAnimated)), //0.05
        ),
        Offset(
          width * (.5 + (0.05 * valueOvalAnimated)), //0.55
          height * (0.08 - (0.04 * valueOvalAnimated)), //0.04
        ),
      ];
    } else if (step == 3) {
      listCurve = [
        Offset(
          width * (.001 + valueAnimated(0.049)), //0.05
          height * 0.05, //0.05
        ),
        Offset(
          width * (0.55 - valueAnimated(0.05)), //0.55
          height * 0.04, //0.04
        ),
      ];
    } else if (step == 4) {
      listCurve = [
        Offset(
          width * (.05 - valueAnimated(0.02)), //0.05
          height * (0.05 - valueAnimated(0.05)), //0.05
        ),
        Offset(
          width * (0.50 - valueAnimated(0.05)), //0.5
          height * (.04 + valueAnimated(0.02)), //0.04
        ),
      ];
    }

    return listCurve;
  }

  final bool stroke;

  double width = 0;
  double height = 0;
  @override
  void paint(Canvas canvas, Size size) {
    width = size.width;
    height = size.height;
    final paintOne = Paint();

    paintOne.style = stroke ? PaintingStyle.stroke : PaintingStyle.fill;
    paintOne.strokeCap = StrokeCap.round;
    paintOne.strokeWidth = widthOvalLine;
    paintOne.shader = !stroke
        ? ui.Gradient.linear(Offset(size.width / 2, 0),
            Offset(size.width / 2, size.height), const [
            Color(0xffF52C6A),
            Color(0xffF72D6B),
          ])
        : null;
    if (stroke) {
      paintOne.color = const Color(0xffF52C6A).withOpacity(0.1);
    }

    final path = Path();
    final moveToOffSet = moveTo(step);

    path.moveTo(moveToOffSet.dx, moveToOffSet.dy);

    final offSetCurve1 = curve1(step);

    //Curve 1
    path.quadraticBezierTo(
      offSetCurve1[0].dx, //DONDE VA A INTENTARM HACER LA Curve
      offSetCurve1[0].dy, //EL ANGULO
      offSetCurve1[1].dx, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
      offSetCurve1[1].dy, //DESDE ARRIBA A DONDE LLEGA
    );

    final offSetCurve2 = curve2(step);

    //Curve 2
    path.quadraticBezierTo(
      offSetCurve2[0].dx,
      offSetCurve2[0].dy,
      offSetCurve2[1].dx,
      offSetCurve2[1].dy,
    );

    final offSetCurve3 = curve3(step);

    //Curve 3
    path.quadraticBezierTo(
      offSetCurve3[0].dx,
      offSetCurve3[0].dy,
      offSetCurve3[1].dx,
      offSetCurve3[1].dy,
    );

    final offSetCurve4 = curve4(step);
    //Curve 4
    path.quadraticBezierTo(
      offSetCurve4[0].dx,
      offSetCurve4[0].dy,
      offSetCurve4[1].dx,
      offSetCurve4[1].dy,
    );

    //SHADOW
    if (!stroke) {
      // canvas.translate(-10, 3);
      canvas.drawShadow(path, const Color(0xffF52C6A), 15, false);
    }
    canvas.drawPath(path, paintOne);
    canvas.save();

    //SOLO LA LINEA
    if (stroke) {
      final paint = Paint()
        ..color = const Color(0xffF52C6A)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = widthLine;

      final path2 = Path();

      path2.moveTo(moveToOffSet.dx, moveToOffSet.dy);

      //Curve 1
      path2.quadraticBezierTo(
        offSetCurve1[0].dx, //DONDE VA A INTENTARM HACER LA Curve
        offSetCurve1[0].dy, //EL ANGULO
        offSetCurve1[1].dx, //EL ANCHO HASTA DONDE TERMINA EL PUNTO
        offSetCurve1[1].dy, //DESDE ARRIBA A DONDE LLEGA
      );

      canvas.drawPath(path2, paint);

      if (step == 1) {
        path2.quadraticBezierTo(
          offSetCurve2[0].dx,
          offSetCurve2[0].dy,
          offSetCurve2[1].dx,
          offSetCurve2[1].dy,
        );

        path2.quadraticBezierTo(
          offSetCurve3[0].dx,
          offSetCurve3[0].dy,
          offSetCurve3[1].dx,
          offSetCurve3[1].dy,
        );

        ui.PathMetric pathMetric = path2.computeMetrics().first;
        Path extractPath = pathMetric.extractPath(
            0.0, pathMetric.length * (stroke ? valueLineAnimated : 1));
        canvas.drawPath(extractPath, paint);
      }

      if (step == 2) {
        path2.quadraticBezierTo(
          offSetCurve2[0].dx,
          offSetCurve2[0].dy,
          offSetCurve2[1].dx,
          offSetCurve2[1].dy,
        );

        path2.quadraticBezierTo(
          offSetCurve3[0].dx,
          offSetCurve3[0].dy,
          offSetCurve3[1].dx,
          offSetCurve3[1].dy,
        );

        canvas.drawPath(path2, paint);
      }

      if (step == 3) {
        path2.quadraticBezierTo(
          offSetCurve2[0].dx,
          offSetCurve2[0].dy,
          offSetCurve2[1].dx,
          offSetCurve2[1].dy,
        );

        path2.quadraticBezierTo(
          offSetCurve3[0].dx,
          offSetCurve3[0].dy,
          offSetCurve3[1].dx,
          offSetCurve3[1].dy,
        );
        canvas.drawPath(path2, paint);
        path2.quadraticBezierTo(
          offSetCurve4[0].dx,
          offSetCurve4[0].dy,
          offSetCurve4[1].dx,
          offSetCurve4[1].dy,
        );

        ui.PathMetric pathMetric = path2.computeMetrics().first;
        Path extractPath = pathMetric.extractPath(
            0.0, pathMetric.length * (stroke ? valueLineAnimated : 1));
        canvas.drawPath(extractPath, paint);
      }

      if (step == 4) {
        path2.quadraticBezierTo(
          offSetCurve2[0].dx,
          offSetCurve2[0].dy,
          offSetCurve2[1].dx,
          offSetCurve2[1].dy,
        );

        path2.quadraticBezierTo(
          offSetCurve3[0].dx,
          offSetCurve3[0].dy,
          offSetCurve3[1].dx,
          offSetCurve3[1].dy,
        );
        path2.quadraticBezierTo(
          offSetCurve4[0].dx,
          offSetCurve4[0].dy,
          offSetCurve4[1].dx,
          offSetCurve4[1].dy,
        );
        canvas.drawPath(path2, paint);
      }
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
