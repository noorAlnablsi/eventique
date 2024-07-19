import 'package:eventique/color.dart';
import 'package:flutter/material.dart';

class ShareEventScreen extends StatelessWidget {
  static const routeName = '/share-event';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Thank you for letting us be a part of',
              style: TextStyle(
                color: primary,
                fontFamily: 'IrishGrover',
                fontSize: 18,
              ),
            ),
            Text(
              'your wonderful momments',
              style: TextStyle(
                color: primary,
                fontFamily: 'IrishGrover',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.45,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
                border: Border.all(color: secondary, width: 2),
              ),
              child: Center(
                child: Text(
                  'Please select at least three images',
                  style: TextStyle(
                    color: secondary.withOpacity(0.8),
                    fontFamily: 'IrishGrover',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: secondary.withOpacity(0.8),
                fixedSize: Size(size.width * 0.4, size.height * 0.04),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Pick Images',
                style: TextStyle(
                  fontFamily: 'IrishGrover',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              'Tell us about your event in one word !',
              style: TextStyle(
                color: primary,
                fontFamily: 'IrishGrover',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextField(),
            SizedBox(
              height: size.height * 0.04,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primary.withOpacity(0.8),
                fixedSize: Size(size.width * 0.4, size.height * 0.04),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Share',
                style: TextStyle(
                  fontFamily: 'IrishGrover',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
