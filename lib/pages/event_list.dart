import 'package:flutter/material.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Events",
                style: TextStyle(fontFamily: 'IrishGrover-Regular'),
              )
            ],
          )
        ],
      ),
    );
  }
}
