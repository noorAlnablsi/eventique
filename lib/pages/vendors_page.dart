import 'package:flutter/material.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(children: [
        SizedBox(
          child: TextField(decoration: InputDecoration(icon: Icon(Icons.search)),),
        )
      ],),
    );
  }
}