import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainsList;
  final ProductCart cart;
  const GrainsPage({
    Key key,
    @required this.grainsList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Café de grano"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemGrains(
            grain: grainsList[index],
            cart:cart,
          );
        },
      ),
    );
  }
}
