import 'package:flutter/material.dart';

class BackgroundSliver extends StatelessWidget {
  const BackgroundSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'assets/sliver_with_scrollable_tabs/sushi.jpeg',
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }
}
