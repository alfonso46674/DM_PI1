import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Registro_Login extends StatefulWidget {
  Registro_Login({Key key}) : super(key: key);

  @override
  _Registro_LoginState createState() => _Registro_LoginState();
}

class _Registro_LoginState extends State<Registro_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),

              //Imagen de CUPPING con LOGO
              Image(
                image: AssetImage("assets/images/cuppingInvisible.png"),
                height: 200,
                width: 300,
              ),

              SizedBox(
                height: 30,
              ),

              //Fila para el boton de registrarse

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.95, // para que abarque casi todo el ancho de la pantalla
                    child: MaterialButton(
                      child: Text("REGISTRATE"),
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pushNamed(context, '/registro');
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              //Fila para el boton de ingresar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.95, // para que abarque todo el ancho de la pantalla
                    child: MaterialButton(
                      child: Text(
                        "INGRESA",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Akzidens-Grotesk',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
