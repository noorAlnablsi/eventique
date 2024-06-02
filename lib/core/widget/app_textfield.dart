// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.labelText,
    required this.myIcon,
    required this.hintText,
      this.traillingIcon,
    this.obscureText = false,
  }) : super(key: key);
  final String labelText;
  final IconData myIcon;
  final String hintText;
  final bool obscureText;
  final Widget? traillingIcon; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 55,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 87, 14, 87),
            fontSize: 16,
            fontFamily: 'Quattrocento',
            fontWeight: FontWeight.w700,
          ),
          prefixIcon: Icon(
            myIcon,
            color: Color.fromARGB(255, 87, 14, 87),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 87, 14, 87)),
            borderRadius: BorderRadius.circular(10),
          ),suffixIcon: traillingIcon ?? null,
        ),
      ),
    );
  }
}
