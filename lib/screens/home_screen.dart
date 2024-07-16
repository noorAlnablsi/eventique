import '/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card(
            //   elevation: 20,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(20)),
            //   ),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         gradient: LinearGradient(
            //             begin: Alignment.centerLeft,
            //             end: Alignment.centerRight,
            //             stops: [
            //               0,
            //               0.99
            //             ],
            //             colors: [
            //               primary,
            //               Color.fromARGB(255, 255, 224, 248)
            //             ])),
            //     width: 313,
            //     height: 74,
            //     child: TextButton(
            //       onPressed: () {},
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "Create Your Event",
            //             style: TextStyle(
            //                 color: Color.fromARGB(255, 255, 253, 240)),
            //           ),
            //           IconButton(
            //               onPressed: () {}, icon: Icon(Icons.arrow_forward))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            Center(
              child: Container(
                margin: EdgeInsets.only(
                    // top: size.height * 0.001,
                    bottom: size.height * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 0.99],
                    colors: [primary, Color.fromARGB(255, 255, 224, 248)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: Offset(0, 10), //
                    ),
                  ],
                ),
                width: size.width * 0.9,
                height: size.height * 0.1,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Create Your Event",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 253, 240),
                            fontSize: 20,
                            fontFamily: 'IrishGrover'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Text("Packages",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'IrishGrover',
                  color: primary,
                )),
            Text(
              "Everything you need in one place at discounted prices.",
              style: TextStyle(
                  fontFamily: 'IrishGrover', fontSize: 16, color: primary),
            ),

            SizedBox(
              height: size.width * 0.04,
            ),

            Container(
              height: size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Rectangle (3).png"),
                        ),
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          Gap(100),
                          Text(
                            "birthday",
                            style: TextStyle(
                                color: onPrimary,
                                fontFamily: 'Kanit',
                                fontSize: 20),
                          ),
                        ],
                      )),
                      width: size.width / 2,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.width * 0.06,
            ),

            Text(
              "You & Us",
              style: TextStyle(
                fontSize: 28,
                color: primary,
                fontFamily: 'IrishGrover',
              ),
            ),
            SizedBox(
              height: size.width * 0.02,
            ),

            Text(
              "Your Joy Our Craft !",
              style: TextStyle(
                fontSize: 18,
                color: primary,
                fontFamily: 'IrishGrover',
              ),
            ),
            SizedBox(
              height: size.width * 0.06,
            ),

            Expanded(
                child: ListView.builder(
                    itemCount: 18,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Card(
                          child: Container(
                            height: 129,
                            width: 302,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/Rectangle.png")),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 135,
                                  width: 110,
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "It was ..",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            color: onPrimary),
                                      ),
                                      Gap(15),
                                      Text(
                                        "Magical",
                                        style: TextStyle(
                                            fontFamily: 'KaushanScript',
                                            fontSize: 20,
                                            color: onPrimary),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
