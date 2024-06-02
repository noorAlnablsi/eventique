import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:eventique/core/resources/color.dart';
import 'package:eventique/pages/chat%20_screen.dart';
import 'package:eventique/pages/event_list.dart';
import 'package:eventique/pages/home_page.dart';
import 'package:eventique/pages/orders%20_page.dart';
import 'package:eventique/pages/vendors_page.dart';
import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
    List Screen=[
    HomePage(),
    EventListPage(),
    VendorsPage(),
    OrdersPage(),
    ChatScreenPage(),
  ];

  int _selctedIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
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
                label: 'CheckList',
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
          onTap: (index){
            setState(() {
             _selctedIndex=index;
            });
          },
        ),
        body: Screen[_selctedIndex],);
  }
}