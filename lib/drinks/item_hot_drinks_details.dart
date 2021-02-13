import 'package:enum_to_string/enum_to_string.dart';
import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment/payment_page.dart';
import 'package:flutter/material.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  final ProductCart cart;
  final ProductHotDrinks drink;

  ItemHotDrinksDetails({
    Key key,
    @required this.cart,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
//booleano para saber si esta presionado el boton like
  bool isPressedLike = false;

//Arreglo para los tamaños que se van a mostrar en los botones. Para tener una asociacion <int,string>
  var _productSizesToShow = {0: "Mediano", 1: "Chico", 2: "Grande"};

//Arreglo de objetos que tendra la informacion de los botones. Se relaciona con el arreglo anterior
//El key del arreglo anterior se usa para encontrar la posicion del boton a buscar en este areglo de objetos
  var _buttonList = [
    {"id": 0, "name": "Mediano", "state": true, "acronym": "M"},
    {"id": 1, "name": "Chico", "state": false, "acronym": "CH"},
    {"id": 2, "name": "Grande", "state": false, "acronym": "G"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.drink.productTitle}"),
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
                              icon: widget.drink.liked
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border_outlined),
                              onPressed: () {
                                widget.drink.liked = !widget.drink.liked;
                                setState(() {});
                              },
                            ),
                          ),
                          Image.network(
                            "${widget.drink.productImage}",
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
                    "${widget.drink.productTitle}",
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
                        "${widget.drink.productDescription}",
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
                      // "\$${style == 1 ? (dessert.productPrice * 0.1).toStringAsFixed(2) : dessert.productPrice}",
                      "\$${widget.drink.productPrice}",

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
                                  case "CH":
                                    widget.drink.productSize = ProductSize.CH;
                                    break;

                                  case "M":
                                    widget.drink.productSize = ProductSize.M;
                                    break;

                                  case "G":
                                    widget.drink.productSize = ProductSize.G;
                                    break;
                                  default:
                                }

                                //Actualizar precio en base del tamaño del producto
                                widget.drink.productPrice =
                                    widget.drink.productPriceCalculator();

                                print(widget.drink.productPrice);
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
                          //Si no hay nada en el carrito, meter lo primero que meta el cliente
                          if (widget.cart.products.length == 0) {
                            widget.cart.products.add(
                              ProductItemCart(
                                  productTitle: widget.drink.productTitle,
                                  productAmount: widget.drink.productAmount,
                                  productPrice: widget.drink.productPrice,
                                  productDescription:
                                      widget.drink.productDescription,
                                  productImage: widget.drink.productImage,
                                  isLiked: widget.drink.liked,
                                  productSize: EnumToString.convertToString(
                                      widget.drink.productSize),
                                  typeOfProduct: ProductType.BEBIDAS),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Elemento agregado al carrito'),
                                backgroundColor: Colors.orange,
                              ),
                            );
                            Navigator.pushNamed(context, '/home');
                          } else {
                            // Si ya hay algo en el carrito,revisar que no exista el producto en el carrito por medio de su titulo y tamaño
                            var found = 0;
                            for (var i = 0;
                                i < widget.cart.products.length;
                                i++) {
                              print("i ${i}");
                              print(
                                  "widget.cart.products[i].productTitle ${widget.cart.products[i].productTitle}"
                                  "// widget.drink.productTitle ${widget.drink.productTitle}");
                              var enumResult = EnumToString.convertToString(
                                  widget.drink.productSize);
                              print(
                                  "widget.cart.products[i].productSize ${widget.cart.products[i].productSize} // EnumToString.convertToString(widget.drink.productSize) ${enumResult}");

                              if (widget.cart.products[i].productTitle ==
                                      widget.drink.productTitle &&
                                  widget.cart.products[i].productSize ==
                                      EnumToString.convertToString(
                                          widget.drink.productSize)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Elemento ya en el carrito"),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                                found = 1;
                              }
                            }

                            //Si el elemento no esta en el carrito se agrega
                            if (found == 0) {
                              widget.cart.products.add(
                                ProductItemCart(
                                    productTitle: widget.drink.productTitle,
                                    productAmount: widget.drink.productAmount,
                                    productPrice: widget.drink.productPrice,
                                    productDescription:
                                        widget.drink.productDescription,
                                    productImage: widget.drink.productImage,
                                    isLiked: widget.drink.liked,
                                    productSize: EnumToString.convertToString(
                                        widget.drink.productSize),
                                    typeOfProduct: ProductType.BEBIDAS),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Elemento agregado al carrito'),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                            }
                          }

                          Navigator.pushNamed(context, '/home');
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(),
                              settings: RouteSettings(
                                arguments: widget.drink.productTitle,
                              ),
                            ),
                          );
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
