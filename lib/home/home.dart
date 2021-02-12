import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';

class Home extends StatefulWidget {
  final String title;
  final ProductCart cart;

  Home({
    Key key,
    this.title,
    @required this.cart,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(
                        productsList: widget.cart.products
                      )));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "assets/images/hotDrinks.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "assets/images/postres.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Café de grano",
              image: "assets/images/granos.png",
            ),
          ),
          GestureDetector(
            onTap: _showSnackBarMugs,
            child: ItemHome(
              title: "Tazas",
              image: "assets/images/comingSoon.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).pushNamed('/bebidas');
  }

  void _openGrainsPage() {
    Navigator.of(context).pushNamed('/granos');
  }

  void _openDessertPage() {
    Navigator.of(context).pushNamed('/postres');
  }

  void _showSnackBarMugs() {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text("¡Proximamente!")));
  }
}
