import 'package:flutter/material.dart';

class ItemHome extends StatelessWidget {
  final String title;
  final String image;
  ItemHome({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          // Positioned.fill(
          //   top: 16,
          //   child: Card(
          //     elevation: 4.0,
          //     margin: EdgeInsets.all(24.0),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //     color: Colors.indigo,
          //     child: Container(height: 180),
          //   ),
          // ),
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 20, bottom: 20, left: 24, right: 24),
            decoration: BoxDecoration(
              color: Color.fromARGB(170, 0x8B, 0x81, 0x75),
            ),
            child: Row(
              children: [
                Container(
                  width: 160,
                  // margin: EdgeInsets.only(left: 16),
                  // decoration: BoxDecoration(
                  //   color: Colors.yellow[300],
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(30),
                  //   ),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      "$title",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Image.asset(
                "$image",
                fit: BoxFit.contain,
                height: 180,
                width: 180,
              ),
              // child: Image.network(
              //   "$image",
              //   fit: BoxFit.contain,
              //   height: 180,
              //   width: 180,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
