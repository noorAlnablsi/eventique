//noor and taghreeed edit
import 'package:eventique/providers/home_provider.dart';
import 'package:eventique/screens/one_package_details.dart';
import 'package:eventique/screens/one_you&us.dart';
import 'package:provider/provider.dart';

import '/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loadingPackages = false;
  bool _loadingShares = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllPackages();
    fetchAllShares();
  }

  Future<void> fetchAllPackages() async {
    try {
      setState(() {
        _loadingPackages = true;
      });
      await Provider.of<HomeProvider>(context, listen: false).fetchPackages();
      setState(() {
        _loadingPackages = false;
      });
    } catch (error) {
      setState(() {
        _loadingPackages = false;
      });
      print(error);
    }
  }

  Future<void> fetchAllShares() async {
    try {
      setState(() {
        _loadingShares = true;
      });
      await Provider.of<HomeProvider>(context, listen: false).fetchYouAndUs();
      setState(() {
        _loadingShares = false;
      });
    } catch (error) {
      setState(() {
        _loadingShares = false;
      });
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeProvider = Provider.of<HomeProvider>(context);
    final loadedPackages = homeProvider.allPackages;
    final loadedYouAndUs = homeProvider.allYouAndUs;

    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: size.height * 0.04),
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
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ),
            //start the packages
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Packages",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'IrishGrover',
                    color: primary,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Everything you need in one place at discounted prices.",
                style: TextStyle(
                    fontFamily: 'IrishGrover', fontSize: 16, color: primary),
              ),
            ),
            SizedBox(
              height: size.width * 0.04,
            ),
            _loadingPackages
                ? CircularProgressIndicator()
                : SizedBox(
                    height: size.height * 0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: loadedPackages.length,
                      itemBuilder: (ctx, i) {
                        return InkWell(
                          onTap: () {
                            //here i will pass the id
                            Navigator.of(context).pushNamed(
                              OnePackageDetailsPage.routeName,
                              arguments: loadedPackages[i].id,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Rectangle (3).png'),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Gap(100),
                                  Text(
                                    loadedPackages[i].name!,
                                    style: TextStyle(
                                        color: onPrimary,
                                        fontFamily: 'Kanit',
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            width: size.width / 2,
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(
              height: size.width * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "You & Us",
                style: TextStyle(
                  fontSize: 28,
                  color: primary,
                  fontFamily: 'IrishGrover',
                ),
              ),
            ),
            SizedBox(
              height: size.width * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Your Joy Our Craft !",
                style: TextStyle(
                  fontSize: 18,
                  color: primary,
                  fontFamily: 'IrishGrover',
                ),
              ),
            ),
            SizedBox(
              height: size.width * 0.06,
            ),
            _loadingShares
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                        itemCount: loadedYouAndUs.length,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  YouAndUsPage.routeName,
                                  arguments: loadedYouAndUs[index].id);
                            },
                            child: Card(
                              child: Container(
                                height: 129,
                                width: 302,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        loadedYouAndUs[index].imagesUrl![0]),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 135,
                                      width: 110,
                                      color: Color.fromARGB(209, 255, 255, 255),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            loadedYouAndUs[index].description!,
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
