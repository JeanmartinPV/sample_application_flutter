import 'package:flutter/material.dart';

class SliverHeaderData extends StatelessWidget {
  const SliverHeaderData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Asiatisch .  koreanisch . Japnisch',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(
                Icons.access_time,
                size: 14,
              ),
              SizedBox(width: 4),
              Text(
                '30-40 Min   4.3',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.star,
                size: 14,
              ),
              SizedBox(width: 8),
              Text(
                '\$6.50 Fee',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
