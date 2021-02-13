import 'package:enum_to_string/enum_to_string.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment/payment_page.dart';
import 'package:flutter/material.dart';

class ItemDessertsDetails extends StatefulWidget {
  final ProductDesserts dessert;
  final ProductCart cart;
  ItemDessertsDetails({
    Key key,
    @required this.cart,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsDetailsState createState() => _ItemDessertsDetailsState();
}

class _ItemDessertsDetailsState extends State<ItemDessertsDetails> {
//booleano para saber si esta presionado el boton like
  bool isPressedLike = false;

//Arreglo para los tamaños que se van a mostrar en los botones. Para tener una asociacion <int,string>
  var _productSizesToShow = {0: "Mediano", 1: "Chico"};

//Arreglo de objetos que tendra la informacion de los botones. Se relaciona con el arreglo anterior
//El key del arreglo anterior se usa para encontrar la posicion del boton a buscar en este areglo de objetos
  var _buttonList = [
    {"id": 0, "name": "Chico", "state": true, "acronym": "CH"},
    {"id": 1, "name": "Mediano", "state": false, "acronym": "M"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.dessert.productTitle}"),
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
                              icon: widget.dessert.liked
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border_outlined),
                              onPressed: () {
                                widget.dessert.liked = !widget.dessert.liked;
                                setState(() {});
                              },
                            ),
                          ),
                          Image.network(
                            "${widget.dessert.productImage}",
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
                    "${widget.dessert.productTitle}",
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
                        "${widget.dessert.productDescription}",
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
                      "\$${widget.dessert.productPrice}",
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
                                  case "Chico":
                                    widget.dessert.productSize = ProductSizeDessert.CH;
                                    break;

                                  case "Mediano":
                                    widget.dessert.productSize = ProductSizeDessert.M;
                                    break;

                                  default:
                                }

                                //Actualizar precio en base del tamaño del producto
                                widget.dessert.productPrice =
                                    widget.dessert.productPriceCalculator();
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

                           if (widget.cart.products.length == 0) {
                            widget.cart.products.add(
                              ProductItemCart(
                                  productTitle: widget.dessert.productTitle,
                                  productAmount: widget.dessert.productAmount + 1,
                                  productPrice: widget.dessert.productPrice,
                                  productDescription:
                                      widget.dessert.productDescription,
                                  productImage: widget.dessert.productImage,
                                  isLiked: widget.dessert.liked,
                                  productSize: EnumToString.convertToString(
                                      widget.dessert.productSize),
                                  typeOfProduct: ProductType.POSTRES),
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
                                  print("widget.cart.products[i].productTitle ${widget.cart.products[i].productTitle}" "// widget.dessert.productTitle ${widget.dessert.productTitle}");
                                  var enumResult = EnumToString.convertToString(widget.dessert.productSize);
                                  print("widget.cart.products[i].productSize ${widget.cart.products[i].productSize} // EnumToString.convertToString(widget.dessert.productSize) ${enumResult}" );                                   
                              if (widget.cart.products[i].productTitle ==
                                      widget.dessert.productTitle &&
                                  widget.cart.products[i].productSize ==
                                      EnumToString.convertToString(
                                          widget.dessert.productSize)) {
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
                            if(found == 0){
                               
                              
                                widget.cart.products.add(
                                  ProductItemCart(
                                      productTitle: widget.dessert.productTitle,
                                      productAmount: widget.dessert.productAmount + 1,
                                      productPrice: widget.dessert.productPrice,
                                      productDescription:
                                          widget.dessert.productDescription,
                                      productImage: widget.dessert.productImage,
                                      isLiked: widget.dessert.liked,
                                      productSize: EnumToString.convertToString(
                                          widget.dessert.productSize),
                                      typeOfProduct: ProductType.POSTRES),
                                );
                                // print(widget.cart.products);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Elemento agregado al carrito'),
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
                                arguments: widget.dessert.productTitle,
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
