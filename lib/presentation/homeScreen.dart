import 'package:flutter/material.dart';
import 'package:versiculos_app/presentation/widget/cubit/reference_cubit.dart';
import 'package:versiculos_app/presentation/widget/referenceWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({Key key, @required this.title}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ReferenceContainer(),
      ),
    );
  }
}
