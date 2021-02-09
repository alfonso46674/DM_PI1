import 'package:flutter/material.dart';



class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    //Manage the splash screen time
    Future.delayed(Duration(milliseconds: 3000),
        () => {Navigator.of(context).pushNamed('/registroLogin')});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash.png"),
          fit: BoxFit.cover,
        ),
      ),
      // child: Column(
      //   children: [
      //     Padding(
      //         padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 5.0)),
      //    Image.asset(
      //      'assets/images/cupping.png',
      //    ),
      //   ],
      // ),
    ));
  }
}

// return Scaffold(
//     body: Stack(
//   children: <Widget>[
//     Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("assets/images/coffee.jpg"),
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//   ],
// ));