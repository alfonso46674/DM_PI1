import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  @override
  Widget build(BuildContext context) {
     return GestureDetector(
       onTap: _openDetails,
            child: Container(
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
                            "Café de grano",
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
                            "${widget.grain.productTitle}",
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
                            "\$${widget.grain.productPrice}",
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
                      child: Image.network(
                        "${widget.grain.productImage}",
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
    ),
     );
  }


  void _openDetails() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ItemGrainsDetails(),
      settings: RouteSettings(
        arguments: widget.grain,
      ),
    ));
  }
}
