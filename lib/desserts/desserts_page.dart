import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDesserts> dessertsList;
  const DessertsPage({
    Key key,
    @required this.dessertsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postres"),
      ),
      body: ListView.builder(
        itemCount: dessertsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDesserts(
            dessert: dessertsList[index],
          );
        },
      ),
    );
  }
}
