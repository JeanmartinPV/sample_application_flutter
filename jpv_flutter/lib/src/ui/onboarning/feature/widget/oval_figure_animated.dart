import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jpv_flutter/src/ui/onboarning/feature/widget/animated_sign.dart';
import 'package:jpv_flutter/src/ui/onboarning/feature/widget/circle_animated.dart';

class OvalFigureAnimated extends StatefulWidget {
  const OvalFigureAnimated({
    Key? key,
    required this.countFigure,
    required this.height,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  final int countFigure;
  final double height;
  final double width;
  final VoidCallback? onTap;

  @override
  State<OvalFigureAnimated> createState() => _OvalFigureAnimatedState();
}

class _OvalFigureAnimatedState extends State<OvalFigureAnimated>
    with TickerProviderStateMixin {
  late final AnimationController _ovalController;
  late final Animation<double> ovalAnimation;

  @override
  void initState() {
    _ovalController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _ovalController,
      curve: Curves.decelerate,
    );

    ovalAnimation = Tween<double>(begin: 0, end: 1.0).animate(curvedAnimation)
      ..addListener(update);

    degrees = setRotation(90);
    super.initState();
  }

  update() {
    setState(() {});
  }

  @override
  void dispose() {
    _ovalController.dispose();
    ovalAnimation.removeListener(update);
    super.dispose();
  }

  double setRotation(int degrees) => degrees * math.pi / 180;

  double valueOvalAnimation = 0;
  double clamInit = 0;
  double degrees = 0;
  int countSlide = 0;

  Future<void> validation() async {
    countSlide = widget.countFigure;
    if (countSlide == 1) {
      _ovalController.duration = const Duration(milliseconds: 800);

      _ovalController.forward();
      valueOvalAnimation = ovalAnimation.value;

      if (_ovalController.value == 1.0) {
        _ovalController.reset();
      }
    } else if (countSlide == 2) {
      _ovalController.duration = const Duration(milliseconds: 600);

      _ovalController.forward();
      valueOvalAnimation = ovalAnimation.value;
      if (_ovalController.value == 1.0) {
        _ovalController.reset();
      }
    } else if (countSlide == 3) {
      _ovalController.duration = const Duration(milliseconds: 600);
      _ovalController.forward();
      valueOvalAnimation = ovalAnimation.value;
      if (_ovalController.value == 1.0) {
        _ovalController.reset();
      }
    } else if (countSlide == 4) {
      _ovalController.duration = const Duration(milliseconds: 1000);

      _ovalController.forward();
      valueOvalAnimation = ovalAnimation.value;
      if (_ovalController.value == 1.0) {
        _ovalController.reset();
        _ovalController.duration = const Duration(milliseconds: 1000);
      }
    }
    if (valueOvalAnimation > 0.95 && (countSlide == 1 || countSlide == 3)) {
      clamInit = 0.6;
    } else if (valueOvalAnimation > 0.4 && countSlide == 2) {
      clamInit = 0.6;
    } else {
      clamInit = 0;
    }
  }

  bool initAnimation = false;

  @override
  Widget build(BuildContext context) {
    validation();

    late final Tween<double> tweenValue;
    if (countSlide == 1 && clamInit > 0.3) {
      tweenValue = Tween<double>(begin: 0, end: 1);
    } else if (countSlide == 2 && clamInit > 0.5) {
      tweenValue = Tween<double>(begin: 0, end: 1);
    } else if ((countSlide == 3 || countSlide == 4) && clamInit > 0.5) {
      tweenValue = Tween<double>(begin: 0, end: 1);
    } else {
      tweenValue = Tween<double>(begin: 0, end: 0);
    }

    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: LayoutBuilder(builder: (context, constraints) {
          final heightCotainter = constraints.maxHeight;
          final widthCotainter = constraints.maxWidth;
          return Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomPaint(
                  key: UniqueKey(),
                  painter: CircleAnimated(
                    step: countSlide,
                    valueOvalAnimated: valueOvalAnimation,
                    valueLineAnimated: 0,
                    stroke: false,
                    widthOvalLine: 5,
                    widthLine: 8,
                  ),
                ),
              ),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 800),
                tween: tweenValue,
                curve: Curves.ease,
                key: Key(widget.countFigure.toString()),
                builder: (_, double value, __) {
                  double angleAnimation = 0;
                  if (countSlide == 3 && clamInit > 0.5) {
                    final angle = lerpDouble(0, degrees, value);
                    angleAnimation = angle!;
                  } else {
                    angleAnimation = 0;
                  }
                  if (countSlide == 4) {
                    angleAnimation = 90 * math.pi / 180;
                  }

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      CustomPaint(
                        key: UniqueKey(),
                        painter: CircleAnimated(
                          step: countSlide,
                          valueOvalAnimated: valueOvalAnimation,
                          valueLineAnimated: value,
                          stroke: true,
                          widthOvalLine: 4,
                          widthLine: 5,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Transform.rotate(
                          angle: angleAnimation,
                          child: SizedBox(
                            height: heightCotainter * 0.15,
                            width: widthCotainter * 0.15,
                            child: CustomPaint(
                              key: UniqueKey(),
                              painter: AnimatedSign(
                                step: countSlide,
                                valueLineAnimated: countSlide == 3
                                    ? value
                                    : valueOvalAnimation,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
