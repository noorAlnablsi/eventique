import 'package:eventique/color.dart';
import 'package:eventique/models/you_and_us_model.dart';
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
  bool _isLoading = false;
  bool _isInit = true;
  final CarouselController _controller = CarouselController();

  Future<void> fetchDetails(int id) async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<HomeProvider>(context, listen: false)
          .findYouAndUsById(id);
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final id = ModalRoute.of(context)!.settings.arguments as int;
      fetchDetails(id);
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final youAndUsData = Provider.of<HomeProvider>(context).oneYourAndUs;
    print('i am in youuuuuuu anddddd usssss screennnnn');
    print('${youAndUsData.id}');
    print('${youAndUsData.description}');
    print('${youAndUsData.imagesUrl}');
    print('${youAndUsData.eventServices}');
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : youAndUsData == null
              ? Center(child: Text('No data found!'))
              : Column(
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
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'Our customers were thrilled, describing their event as a ',
                                style: TextStyle(
                                    fontFamily: 'Kanit',
                                    color: primary,
                                    fontSize: 16)),
                            TextSpan(
                                text: youAndUsData.description ?? '',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'KaushanScript',
                                    color: Color.fromARGB(251, 234, 61, 101))),
                            TextSpan(
                                text: ' experience ',
                                style: TextStyle(
                                    fontFamily: 'Kanit', color: primary)),
                          ],
                        ),
                      ),
                    ),
                    youAndUsData.imagesUrl!.isNotEmpty
                        ? CarouselSlider(
                            items: youAndUsData.imagesUrl!.map((url) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    child: CachedNetworkImage(
                                      width: double.infinity,
                                      imageUrl: url,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        color: const Color.fromARGB(
                                            255, 230, 230, 230),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        color: const Color.fromARGB(
                                            255, 230, 230, 230),
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
                          )
                        : Container(),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Services ",
                        style: TextStyle(
                            fontSize: 28,
                            color: primary,
                            fontFamily: 'IrishGrover'),
                      ),
                    ),
                    Gap(15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: youAndUsData.eventServices!.length,
                        itemBuilder: (context, i) {
                          final service = youAndUsData.eventServices![i];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => ServiceDetails(
                                          serviceId: service.serviceId),
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
                                      service.name ?? '',
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
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
