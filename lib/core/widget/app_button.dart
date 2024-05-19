// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 87, 14, 87),
        borderRadius: BorderRadius.circular(50.0),
      ),
      width: 280,
      height: 47,
      child: FilledButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 87, 14, 87),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ))),
        onPressed: () {},
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
          fontFamily: 'Quattrocento'),
        )),
      ),
    );
  }
}
