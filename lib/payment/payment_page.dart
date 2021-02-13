import 'package:estructura_practica_1/payment/item_payment.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var name = ModalRoute.of(context).settings.arguments;

    _showSelectionDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Image.asset('assets/images/purchased.jpeg'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shopping_bag_outlined),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '!Orden Exitosa!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                            'To orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil.'),
                      )
                    ],
                  )
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: _goHome,
                  child: Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.purple),
                  ),
                )
              ],
            );
          });
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pagos'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 22),
            child: Text(
              'Elige tu método de pago',
              style: TextStyle(color: PRIMARY_COLOR, fontSize: 20),
            ),
          ),
          GestureDetector(
            onTap: _showSelectionDialog,
            child: ItemPayment(
              payment: 'Tarjeta de crédito',
              image: 'assets/images/credit.png',
            ),
          ),
          GestureDetector(
            onTap: _showSelectionDialog,
            child: ItemPayment(
              payment: 'PayPal',
              image: 'assets/images/paypal.png',
            ),
          ),
          GestureDetector(
            onTap: _showSelectionDialog,
            child: ItemPayment(
              payment: 'GiftCart',
              image: 'assets/images/gift.png',
            ),
          )
        ],
      ),
    );
  }

  _goHome() {
    Navigator.of(context).pushNamed('/home');
  }
}
