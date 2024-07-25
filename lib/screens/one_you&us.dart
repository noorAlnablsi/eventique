import 'package:eventique/color.dart';
import 'package:eventique/providers/home_provider.dart';
import 'package:eventique/screens/service_details.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class YouAndUsPage extends StatefulWidget {
  static const routeName = '/you-us';

  @override
  State<YouAndUsPage> createState() => _YouAndUsPageState();
}

class _YouAndUsPageState extends State<YouAndUsPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final youAndUsData =
        Provider.of<HomeProvider>(context).findYouAndUsById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "You & Us",
          style: TextStyle(
            color: primary,
            fontFamily: 'IrishGrover',
            fontSize: 28,
          ),
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
                      style: TextStyle(
                          fontFamily: 'Kanit', color: primary, fontSize: 16)),
                  TextSpan(
                      text: youAndUsData.description,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'KaushanScript',
                          color: Color.fromARGB(251, 234, 61, 101))),
                  TextSpan(
                      text: ' experience ',
                      style: TextStyle(fontFamily: 'Kanit', color: primary)),
                ],
              ),
            ),
          ),
          CarouselSlider(
            items: youAndUsData.eventServices!.map((item) {
              if (item.imgsUrl != null && item.imgsUrl!.isNotEmpty) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: item.imgsUrl![0],
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
              } else {
                return Container(
                  color: const Color.fromARGB(255, 230, 230, 230),
                  child: Center(
                    child: Icon(Icons.image_not_supported),
                  ),
                );
              }
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
            child: Text(
              "Services ",
              style: TextStyle(
                  fontSize: 28, color: primary, fontFamily: 'IrishGrover'),
            ),
          ),
          Gap(15),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: youAndUsData.eventServices!.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => ServiceDetails(
                                    serviceId: youAndUsData
                                        .eventServices![i].serviceId),
                              ),
                            );
                          },
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
                                youAndUsData.eventServices![i].name,
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
