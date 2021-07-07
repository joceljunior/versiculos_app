import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:versiculos_app/presentation/homeScreen.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }

  Widget _introScreen() {
    return Stack(
      children: [
        SplashScreen(
          seconds: 5,
          backgroundColor: Colors.purple[100],
          navigateAfterSeconds: HomeScreen(
            title: 'Versículo Diário',
          ),
          loaderColor: Colors.transparent,
        ),
        Center(
          child: Image.asset(
            'assets/biblieClose.png',
            height: 100,
            width: 300,
          ),
        ),
      ],
    );
  }
}
