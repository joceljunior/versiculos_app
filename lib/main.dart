import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:versiculos_app/presentation/splash/homePage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AppModule());
}

class AppModule extends StatefulWidget {
  @override
  _AppModuleState createState() => _AppModuleState();
}

class _AppModuleState extends State<AppModule> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}
