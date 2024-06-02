import 'package:flutter/material.dart';

class ChatScreenPage extends StatelessWidget {
  const ChatScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon:Icon(Icons.menu),),
              SizedBox(
                width: 15,
              ), 
              Text("chat",
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