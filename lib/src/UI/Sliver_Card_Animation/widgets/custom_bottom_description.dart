import 'package:flutter/material.dart';

class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Drama 😱 Fantasy 👨‍🚒 Science Fiction ✈️',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          'Mistery 🕵️ Adventure 🚣',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
