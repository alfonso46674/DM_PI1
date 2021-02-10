import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  //Controladores para almacenar valores
  var _usernameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  // Para el boton de tipo check
  bool _checkedListTile = false;

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
                height: 60,
              ),

              //Imagen de CUPPING CON LOGO
              Image(
                image: AssetImage("assets/images/cuppingInvisible.png"),
                height: 200,
                width: 300,
              ),

              SizedBox(
                height: 30,
              ),

              //Ingresar usuario
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre completo:',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  //Contenedor para el TextField
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.95, // para que abarque casi todo el ancho de la pantalla
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              //Ingresar email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  //Contenedor para el TextField
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.95, // para que abarque casi todo el ancho de la pantalla
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              //Ingresar el password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password:',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  //Contenedor para el TextField
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.95, // para que abarque casi todo el ancho de la pantalla
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      //Para poner el texto dentro en blanco
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      //Decoracion para el TextField
                      decoration: InputDecoration(
                        filled: true,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 0.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              CheckboxListTile(
                title: Text(
                  "ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: _checkedListTile,
                onChanged: (bool value){
                  setState((){
                    _checkedListTile = value;
                  });
                },
              ),

              SizedBox(
                height: 30,
              ),

              //Boton de ENTRAR
              Container(
                width: MediaQuery.of(context).size.width *
                    0.95, // para que abarque casi todo el ancho de la pantalla
                child: MaterialButton(
                  child: Text("REGISTRATE"),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),

              SizedBox(
                height: 50,
              ),

              Column(
                children: [
                  Text(
                    "¿Ya tienes una cuenta?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  MaterialButton(
                    child: Text(
                      "INGRESA",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
