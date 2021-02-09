import 'package:estructura_practica_1/registro_y_login/login.dart';
import 'package:estructura_practica_1/registro_y_login/registro.dart';
import 'package:estructura_practica_1/registro_y_login/registro_login.dart';
import 'package:estructura_practica_1/splash.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';

import 'home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: PRIMARY_COLOR,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => Splash(),
        "/home": (context) => Home(title: 'Title'),
        "/registroLogin": (context) => Registro_Login(),
        "/login": (context) => Login(),
        "/registro": (context) => Registro(),
      },
    );
  }
}
