import 'package:eventique/providers/reviews.dart';
import 'package:eventique/providers/services_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar(
      {super.key, required this.price, required this.serviceId});
  final double price;
  final int serviceId;

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primarycolor = Theme.of(context).primaryColor;
    TextTheme texttheme = Theme.of(context).textTheme;

    final reviewProvider = Provider.of<Reviews>(context);
    final int selectedIndex=  Provider.of<AllServices>(context).indexForBotomContent;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BottomAppBar(
        shadowColor: Theme.of(context).primaryColor,
        elevation: 30,
        surfaceTintColor: Color(0xFFFFFDF0),
        color: Color(0xFFFFFDF0),
        padding: EdgeInsets.symmetric(horizontal: selectedIndex == 0 ? 26 : 8),
        child: selectedIndex == 0
            ? Row(
                children: [
                  Text(
                    '\$${widget.price}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                    ),
                    child: Text(
                      'Add To List',
                      style: TextStyle(
                          fontFamily: 'IrishGrover',
                          fontSize: 18,
                          color: Color(0xFFFFFDF0)),
                    ),
                  ),
                ],
              )
            : Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width - 80,
                    child: TextField(
                      controller: _commentController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _commentController.clear();
                            setState(() {});
                          },
                          icon: Icon(
                            _commentController.text.isNotEmpty ? Icons.clear : null,
                            color: primarycolor,
                            size: 20,
                          ),
                        ),
                        hintText: 'Share a review....',
                        hintStyle: texttheme.bodyMedium!.copyWith(
                            fontSize: 16, color: primarycolor.withOpacity(0.4)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: primarycolor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: primarycolor),
                        ),
                      ),
                      style:
                          texttheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: primarycolor,
                    ),
                    onPressed: () {
                      if (_commentController.text.isNotEmpty) {
                        reviewProvider.addReview(
                          widget.serviceId,
                          _commentController.text,
                          'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
                          'me',
                        );
                        _commentController.clear();
                        // Close the keyboard
                        FocusScope.of(context).unfocus();
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
