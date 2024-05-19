import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:eventique/core/resources/color.dart';
import 'package:eventique/core/widget/events_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> items = [
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
    "birthday",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 253, 240),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Color.fromARGB(255, 221, 140, 162),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle_notifications,
                      color:primary,
                    )),
              ],
            ),

            Gap(18),

            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [
                          0,
                          0.99
                        ],
                        colors: [
                          primary,
                          Color.fromARGB(255, 255, 224, 248)
                        ])),
                width: 313,
                height: 74,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create Your Event",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 253, 240)),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_forward))
                    ],
                  ),
                ),
              ),
            ),
            Gap(25),
            Text("Packages",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'IrishGrover',
                  color:primary,
                )),
            Container(
              height: 45,
              width: 295,
              child: Text(
                  "Everything you need in one place at discounted prices."),
            ),
            // SizedBox(height: 10,),
            Container(
              height: 172,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/birthday.png"),
                      ),
                    ),
                    width: 202,
                    height: 163,
                  );
                },
              ),
            ),

            Text(
              "You & Us",
              style: TextStyle(fontSize: 28),
            ),
            Text(
              "Your Joy Our Craft !",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
