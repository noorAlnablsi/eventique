import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon:Icon(Icons.menu),),
              SizedBox(
                width: 15,
              ), 
              Text("Orders",
              style: TextStyle(
                fontFamily: 'IrishGrover-Regular'
              ),)
            ],
          )
        ],
      ),
    );
  }
}