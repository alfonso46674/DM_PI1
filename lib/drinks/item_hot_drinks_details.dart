import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  ItemHotDrinksDetails({Key key}) : super(key: key);

  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
  @override
  Widget build(BuildContext context) {
    ProductHotDrinks drink = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Text("${drink.productTitle}"),
    );
  }
}
