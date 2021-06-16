import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/Sliver_Card_Animation/theme.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        color: backgroundcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CustomIcon(
                  icon: Icons.stars,
                  text: '89%',
                ),
                _CustomIcon(
                  icon: Icons.tv,
                  text: 'Netflix',
                ),
                _CustomIcon(
                  icon: Icons.wc,
                  text: 'Tv +14',
                ),
                _CustomIcon(
                  icon: Icons.av_timer_rounded,
                  text: '50m',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '''When a young boy disappears, his mother, a police chief, and his friend must confront terrifying forces in order to get him back.
                      ''',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text(
                'Related shows',
                style: TextStyle(fontSize: 23),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      8,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                height: size.height * 0.18,
                                width: size.width * 0.23,
                                image: AssetImage(
                                    'assets/sliver/related00${index + 1}.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ))),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Seansons',
                style: TextStyle(fontSize: 23),
              ),
            ),
            _Features(
              size: size,
              title: 'Seanson 1',
              subtitle: '8 watched',
              colorline: Colors.red[300]!,
            ),
            _Features(
              size: size,
              title: 'Seanson 2',
              subtitle: '9 watched',
              colorline: Colors.red[300]!,
            ),
            _Features(
              size: size,
              title: 'Seanson 3',
              subtitle: '1 to air',
              colorline: Colors.grey[300]!,
            ),
            _Features(
              size: size,
              title: 'Specials',
              subtitle: '7 to watch',
              colorline: Colors.grey[300]!,
            ),
          ],
        ));
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 45,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}

class _Features extends StatelessWidget {
  const _Features({
    Key? key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.colorline,
  }) : super(key: key);

  final Size size;
  final String title;
  final String subtitle;
  final Color colorline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: size.width,
      color: backgroundcolor,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 5,
                    color: colorline,
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.pending,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
