import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDesserts dessert;
  ItemDesserts({Key key, @required this.dessert}) : super(key: key);


  @override
  _ItemDessertsState createState() => _ItemDessertsState();

}


class _ItemDessertsState extends State<ItemDesserts> {
  
  @override
  
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 20, bottom: 20, left: 24, right: 24),
            decoration: BoxDecoration(
              color: Color.fromARGB(170, 0x8B, 0x81, 0x75),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5, // para que tome el 50% del espacio disponible
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Postre",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Akzidens-Grotesk',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.dessert.productTitle}",
                          style: TextStyle(
                            fontFamily: 'Akzidens-Grotesk',
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "\$${widget.dessert.productPrice}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Akzidens-Grotesk',
                            fontSize: 30.0,
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
                      "${widget.dessert.productImage}",
                      fit: BoxFit.contain,
                      height: 180,
                      width: 180,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}