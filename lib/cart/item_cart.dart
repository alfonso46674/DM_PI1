import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 180,
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 24),
            decoration: BoxDecoration(
              color: Colors.yellow[800],
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${widget.product.productTitle}",
                            style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 21,
                              fontFamily: 'Akzidens-Grotesk',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Tamaño ${widget.product.productSize}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: _remProd),
                              SizedBox(
                                height: 12,
                              ),
                              Text("${widget.product.productAmount}"),
                              SizedBox(
                                height: 12,
                              ),
                              IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: _addProd),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: Image.network(
                "${widget.product.productImage}",
                fit: BoxFit.contain,
                height: 120,
                width: 100,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: widget.product.isLiked
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border_outlined),
                    onPressed: () {
                      widget.product.isLiked = !widget.product.isLiked;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 60),
                  Icon(
                    Icons.delete,
                    color: PRIMARY_COLOR,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }
}
