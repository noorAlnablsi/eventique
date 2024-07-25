//noor
import 'package:eventique/providers/home_provider.dart';
import 'package:provider/provider.dart';
import '/color.dart';
import 'package:eventique/screens/my_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class OnePackageDetailsPage extends StatelessWidget {
  static const routeName = '/package';

  @override
  Widget build(BuildContext context) {
    final packageId = ModalRoute.of(context)!.settings.arguments as int;
    final packageData =
        Provider.of<HomeProvider>(context).findPackageById(packageId);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          packageData.name!,
          style: TextStyle(
            color: primary,
            fontSize: 28,
            fontFamily: 'IrishGrover',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: Colors.black,
            height: 2.0,
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: RichText(
              text: TextSpan(
                // style: TextStyle(backgroundColor: Colors.amber),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Was ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: primary,
                        fontSize: 20),
                  ),
                  TextSpan(
                      text: '\$100',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 217, 54, 54))),
                  TextSpan(
                      text: ' , now only',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primary,
                          fontSize: 20)),
                  TextSpan(
                      text: ' \$75',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 210, 179, 0))),
                  TextSpan(
                      text: ' with this exclusive package deal!',
                      style: TextStyle(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyStaggeredGridView(
              packageId: packageId,
            ),
          ),
        ],
      ),
    );
  }
}
