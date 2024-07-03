import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key,required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Color.fromARGB(255, 226, 147, 168)),),
          SizedBox(height: 8,),
          Text(description,style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}