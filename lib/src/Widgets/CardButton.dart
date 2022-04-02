import 'package:flutter/material.dart';

class CardButtom extends StatelessWidget {
  final String title;
  final String description;
  final String? url;
  final VoidCallback actionTap;

  const CardButtom(
      {Key? key,
      required this.title,
      required this.actionTap,
      required this.description,
      this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final informacion = Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/loadingpoint.gif'),
              image: AssetImage(url ?? 'assets/images/fluter_day.jpg'),
              fadeInDuration: Duration(milliseconds: 200),
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final borderRadiusButton = BorderRadius.circular(20.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Material(
        elevation: 4.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: borderRadiusButton),
        child: InkWell(
          borderRadius: borderRadiusButton,
          onTap: actionTap,
          child: Container(
            height: 320.0,
            child:
                ClipRRect(borderRadius: borderRadiusButton, child: informacion),
          ),
        ),
      ),
    );
  }
}
