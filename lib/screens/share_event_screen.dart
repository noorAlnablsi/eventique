import 'package:eventique/color.dart';
import 'package:eventique/widgets/pickers/multiple_image_picker.dart';
import 'package:flutter/material.dart';

class ShareEventScreen extends StatefulWidget {
  static const routeName = '/share-event';

  @override
  _ShareEventScreenState createState() => _ShareEventScreenState();
}

class _ShareEventScreenState extends State<ShareEventScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  List<String> _imageUrls = [];

  void _onImagesUploaded(List<String> imageUrls) {
    setState(() {
      _imageUrls = imageUrls;
    });
  }

  Future<void> _shareEvent() async {
    if (_imageUrls.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload at least three images')),
      );
      return;
    }

    final description = _descriptionController.text;

    // Send the data to your backend (this is just a placeholder).
    final data = {
      'description': description,
      'images': _imageUrls,
    };

    print('Sending to backend: $data');
  }

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
              'your wonderful moments',
              style: TextStyle(
                color: primary,
                fontFamily: 'IrishGrover',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            MultiImagePicker(onImagesUploaded: _onImagesUploaded),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              'Tell us about your event in one word!',
              style: TextStyle(
                color: primary,
                fontFamily: 'IrishGrover',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  focusColor: secondary,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkBackground),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondary),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                maxLength: 20,
                maxLines: 1,
                cursorColor: secondary,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            ElevatedButton(
              onPressed: _shareEvent,
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
