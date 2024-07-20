import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eventique/core/resources/color.dart';
import 'package:eventique/pages/my_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class YouAndUsPage extends StatefulWidget {
  YouAndUsPage({super.key});
  final List<String> imgList = [
    'images/image.png',
    'images/image.png',
    'images/image.png'
  ];
  @override
  State<YouAndUsPage> createState() => _YouAndUsPageState();
}

class _YouAndUsPageState extends State<YouAndUsPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "You & Us",
          style: TextStyle(
              color: primary, fontFamily: 'IrishGrover', fontSize: 28),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: primary,
          ),
          Gap(10),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: RichText(
                text: TextSpan(
                  // style: TextStyle(backgroundColor: Colors.amber),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Our customers were thrilled, describing their event as a ',
                        style: TextStyle(fontFamily: 'Kanit', color: primary,fontSize: 16)),
                    TextSpan(
                        text: ' Magical ',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'KaushanScript',
                            color: Color.fromARGB(251, 234, 61, 101))),
                    TextSpan(
                        text: ' experience ',
                        style: TextStyle(fontFamily: 'Kanit', color: primary)),
                  ],
                ),
              )),
          CarouselSlider(
            items: widget.imgList.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      imageUrl: item,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: const Color.fromARGB(255, 230, 230, 230),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: const Color.fromARGB(255, 230, 230, 230),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            carouselController: _controller,
            options: CarouselOptions(
              enlargeCenterPage: true,
              height: 400,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),

Gap(20),
Padding(
  padding: const EdgeInsets.all(20.0),
  child: Text("Services ",style: TextStyle(fontSize: 28,color: primary,fontFamily: 'IrishGrover'),),
),
Gap(15),
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFDB8498),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: 80,
                            width: 337,
                            child: ListTile(
                              title: Text(
                                "Dream Cake",
                                style: TextStyle(),
                              ),
                              subtitle: Text("Parfait"),
                              leading: Icon(Icons.cake),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ),
                        ),
                        Gap(8)
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
