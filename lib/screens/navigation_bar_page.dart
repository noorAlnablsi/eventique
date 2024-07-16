import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:eventique/widgets/home/main_drawer.dart';
import '/color.dart';
import 'package:eventique/screens/chat_vendors_list.dart';
import 'package:eventique/screens/event_list.dart';
import 'package:eventique/screens/home_screen.dart';
import 'package:eventique/screens/orders_screen.dart';
import 'package:eventique/screens/cart.dart';
import 'package:eventique/screens/vendors_screen.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class NavigationBarPage extends StatefulWidget {
  static const routeName = '/navigation';

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  List Screen = [
    HomeScreen(),
    VendorsScreen(),
    EventListPage(),
    OrdersScreen(),
    ChatVendorsListScreen(),
  ];

  int _selctedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: const Color(0xFFFFFDF0),
        shadowColor: Color(0xFFFFFDF0),
        actions: [
          //notifivation icon
          Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFFFDF0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Color(0xff662465),
              ),
              onPressed: () {},
              padding: const EdgeInsets.only(bottom: 2),
            ),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: const EdgeInsets.only(left: 30),
              icon: const Icon(
                Typicons.th_menu_outline,
                color: Color(0xffDD8CA1),
                size: 28,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '',
            style: TextStyle(
              color: primary,
              fontSize: 24,
              fontFamily: 'IrishGrover',
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      backgroundColor: Color.fromARGB(255, 255, 253, 240),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selctedIndex,
        backgroundColor: Color.fromARGB(237, 251, 252, 244),
        buttonBackgroundColor: primary,
        color: primary,
        animationDuration: Duration(milliseconds: 300),
        items: [
          CurvedNavigationBarItem(
              child: Icon(
                Icons.home,
                color: white,
              ),
              label: 'Home',
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 223, 230, 228), fontSize: 12)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.storefront,
                color: white,
              ),
              label: 'Vendors',
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 223, 230, 228), fontSize: 12)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.format_align_left,
                color: white,
              ),
              label: 'EventList',
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 223, 230, 228), fontSize: 12)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.list,
                color: white,
              ),
              label: 'Orders',
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 223, 230, 228), fontSize: 12)),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.chat_bubble,
                color: white,
              ),
              label: 'Chat',
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 223, 230, 228), fontSize: 12))
        ],
        onTap: (index) {
          setState(() {
            _selctedIndex = index;
          });
        },
      ),
      body: Screen[_selctedIndex],
    );
  }
}
