import 'package:eventique/color.dart';
import 'package:eventique/widgets/home/main_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('home'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('home'),
      ),
    );
  }
}
