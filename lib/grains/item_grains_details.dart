import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

class ItemGrainsDetails extends StatefulWidget {
  ItemGrainsDetails({Key key}) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
//booleano para saber si esta presionado el boton like
  bool isPressedLike = false;

//Arreglo para los tamaños que se van a mostrar en los botones. Para tener una asociacion <int,string>
  var _productSizesToShow = {0: "CUARTO", 1: "KILO"};

//Arreglo de objetos que tendra la informacion de los botones. Se relaciona con el arreglo anterior
//El key del arreglo anterior se usa para encontrar la posicion del boton a buscar en este areglo de objetos
  var _buttonList = [
    {"id": 0, "name": "CUARTO", "state": false, "acronym": "CUARTO"},
    {"id": 1, "name": "KILO", "state": false, "acronym": "KILO"},
  ];
  @override
  Widget build(BuildContext context) {
    ProductGrains grain = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("${grain.productTitle}"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Stack(
                fit: StackFit.loose,
                children: [
                  Center(
                    child: Container(
                      height: 250.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: grain.liked
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border_outlined),
                              onPressed: () {
                                grain.liked = !grain.liked;
                                setState(() {});
                              },
                            ),
                          ),
                          Image.network(
                            "${grain.productImage}",
                            width: 180,
                            height: 180,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  Text(
                    "${grain.productTitle}",
                    style: TextStyle(
                        fontSize: 24.0, fontFamily: "Akzidens-Grotesk"),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  Container(
                    child: Flexible(
                      child: Text(
                        "${grain.productDescription}",
                        style:
                            TextStyle(fontSize: 20.0, fontFamily: 'OpenSans'),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(
                        "TAMAÑOS DISPONIBLES",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "\$${grain.productPrice}",

                      style: TextStyle(fontSize: 28.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: _productSizesToShow.entries
                    .map(
                      (buttonMap) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 100,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: _buttonList[buttonMap.key]
                                      ["state"] //_buttonStates[buttonMap.value]
                                  ? Colors.purple[100]
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                    color: _buttonList[buttonMap.key]["state"]
                                        ? Colors.purple
                                        : Colors.grey,
                                    width: 2,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: Text(
                              _buttonList[buttonMap.key]["name"],
                              style: TextStyle(
                                color: _buttonList[buttonMap.key]["state"]
                                    ? Colors.purple
                                    : Colors.black,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                //Poner todos los true que haya en false
                                for (var i = 0; i < _buttonList.length; i++) {
                                  if (_buttonList[i]["state"]) {
                                    _buttonList[i]["state"] =
                                        !_buttonList[i]["state"];
                                  }
                                }

                                //Actualizar el estado del boton actual
                                _buttonList[buttonMap.key]["state"] =
                                    !_buttonList[buttonMap.key]["state"];

                                //Actualizar el tamaño del producto
                                switch (_buttonList[buttonMap.key]["acronym"]) {
                                  case "CUARTO":
                                    grain.productWeight = ProductWeight.CUARTO;
                                    break;

                                  case "KILO":
                                    grain.productWeight = ProductWeight.CUARTO;
                                    break;

                                  default:
                                }

                                //Actualizar precio en base del tamaño del producto
                                grain.productPrice = grain.productPriceCalculator();

                              });
                            },
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: Colors.grey),
                        onPressed: () {
                       
                        },
                        child: Text(
                          "AGREGAR AL CARRITO",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () {
                         
                        },
                        child: Text(
                          "COMPRAR AHORA",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
