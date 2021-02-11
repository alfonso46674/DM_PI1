import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                // TODO: Eliminar este boton y adaptar todo el contenido de la pagina de perfil en un Drawer aqui en la pantalla Home
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
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
          ItemHome(
            title: "Postres",
            image: "assets/images/postres.png",
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Café de grano",
              image: "assets/images/granos.png",
            ),
          ),
          ItemHome(
            // TODO: Al hacer clic, que muestre un snackbar de "Proximamente"
            title: "Tazas",
            image: "assets/images/comingSoon.png",
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    // TODO: completar en navigator pasando los parametros a la pagina de HotDrinksPage

    Navigator.of(context).pushNamed('/bebidas');
  }

  void _openGrainsPage() {
    Navigator.of(context).pushNamed('/granos');
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => null),
    );
  }
}
