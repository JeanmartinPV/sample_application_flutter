import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:jpv_flutter/src/ui/onboarning/data/data_mock.dart';
import 'package:jpv_flutter/src/ui/onboarning/feature/widget/custom_background.dart';
import 'package:jpv_flutter/src/ui/onboarning/feature/widget/oval_figure_animated.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;

class OnBoardingAnimation extends StatefulWidget {
  const OnBoardingAnimation({Key? key}) : super(key: key);

  @override
  State<OnBoardingAnimation> createState() => _OnBoardingAnimationState();
}

class _OnBoardingAnimationState extends State<OnBoardingAnimation> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(listener);
    _pageController.dispose();
    super.dispose();
  }

  void listener() {
    valueCurrent.value = _pageController.page!;
  }

  final valueCounter = ValueNotifier<int>(0);
  final valueCounterBack = ValueNotifier<int>(0);
  final valueCurrent = ValueNotifier<double>(0);

  void animatedPageView(int duration, int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: duration),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ui.Color(0xff120F16),
                ui.Color(0xff120F16),
                ui.Color(0xff1B0F18),
              ],
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;
            return Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                ValueListenableBuilder(
                    valueListenable: valueCounterBack,
                    builder: (_, value, __) {
                      return AnimatedPositioned(
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.ease,
                        left: value == 0
                            ? 0
                            : value == 1
                                ? -size.width
                                : (2 * -size.width),
                        top: 0,
                        child: Container(
                          height: size.height,
                          width: size.width * 3,
                          decoration: const BoxDecoration(),
                          child: CustomPaint(
                            painter: CustomBackground(),
                          ),
                        ),
                      );
                    }),
                const Positioned(
                  top: kToolbarHeight,
                  left: 0,
                  right: 0,
                  child: Text(
                    'CONCEPTZILLA',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                    top: height * 0.02,
                    left: 0,
                    right: 0,
                    bottom: height * 0.2,
                    child: ValueListenableBuilder(
                        valueListenable: valueCurrent,
                        builder: (context, double currentPage, __) {
                          return PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            itemCount: DataMock.list.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = DataMock.list[index];
                              final percent = (currentPage - index);
                              final value = percent.clamp(0.0, 1.0);
                              return Column(
                                children: [
                                  const SizedBox(height: 20 + kToolbarHeight),
                                  Expanded(
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.001)
                                        ..rotateY(vector.radians(90 * value)),
                                      child: Image.asset(item.image),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      item.message,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              );
                            },
                          );
                        })),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  top: height * 0.8,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: height * 0.1,
                        left: width * 0.1,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: ValueListenableBuilder<int>(
                            valueListenable: valueCounter,
                            builder: (context, value, _) {
                              return Center(
                                child: OvalFigureAnimated(
                                  onTap: () async {
                                    if (valueCounter.value < 2) {
                                      valueCounter.value++;

                                      if (valueCounter.value <= 1) {
                                        await Future.delayed(
                                          const Duration(milliseconds: 600),
                                        );
                                        valueCounterBack.value++;
                                        animatedPageView(
                                            1500, valueCounter.value);
                                      }
                                      if (valueCounter.value == 2) {
                                        await Future.delayed(
                                          const Duration(milliseconds: 700),
                                        );
                                        valueCounter.value = 3;
                                        await Future.delayed(
                                          const Duration(milliseconds: 500),
                                        );
                                        animatedPageView(1500, 2);
                                        valueCounterBack.value++;
                                        await Future.delayed(
                                          const Duration(milliseconds: 800),
                                        );
                                        valueCounter.value = 4;
                                      }
                                    } else {
                                      valueCounter.value = 0;
                                      valueCounterBack.value = 0;

                                      animatedPageView(1000, 0);
                                    }
                                  },
                                  countFigure: value,
                                  height: height * 0.2,
                                  width: height * 0.2,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
