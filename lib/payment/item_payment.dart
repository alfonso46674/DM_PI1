import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemPayment extends StatelessWidget {
  final String payment;
  final String image;
  ItemPayment({
    Key key,
    @required this.payment,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 24),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0xBC, 0xB0, 0xA1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      "$payment",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,

            // child: ClipRRect(
            //   child: Image.network(
            //     "$image",
            //     fit: BoxFit.contain,
            //     height: 180,
            //     width: 180,
            //   ),
            // ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: Image.asset(
                "$image",
                fit: BoxFit.contain,
                height: 120,
                width: 120,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,

            // child: ClipRRect(
            //   child: Image.network(
            //     "$image",
            //     fit: BoxFit.contain,
            //     height: 180,
            //     width: 180,
            //   ),
            // ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Icon(
                Icons.mode_edit,
                color: PRIMARY_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
