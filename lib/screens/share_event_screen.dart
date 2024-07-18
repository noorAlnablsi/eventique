import 'package:eventique/color.dart';
import 'package:flutter/material.dart';

class ShareEventScreen extends StatelessWidget {
  static const routeName = '/share-event';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        shape: Border(
          bottom: BorderSide(
            color: primary,
            width: 1.6,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Share Event',
            style: TextStyle(
              color: primary,
              fontSize: 24,
              fontFamily: 'IrishGrover',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('data'),
            Container(
              height: 360,
              color: secondary,
            ),
          ],
        ),
      ),
    );
  }
}
