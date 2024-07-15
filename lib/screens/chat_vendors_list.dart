import 'package:eventique/color.dart';
import 'package:eventique/providers/theme_provider.dart';
import 'package:eventique/providers/vendors_provider.dart';
import 'package:eventique/widgets/chat/chat_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatVendorsListScreen extends StatefulWidget {
  static const routeName = '/vendors-list';

  @override
  State<ChatVendorsListScreen> createState() => _ChatVendorsListScreenState();
}

class _ChatVendorsListScreenState extends State<ChatVendorsListScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var sysBrightness = MediaQuery.of(context).platformBrightness;
    ThemeMode? themeMode = themeProvider.getThemeMode();
    bool isLight = themeMode == ThemeMode.light ||
        (sysBrightness == Brightness.light && themeMode != ThemeMode.dark);
    final vendorData =
        Provider.of<VendorsProvider>(context, listen: false).vendors;
    return Scaffold(
        backgroundColor: isLight ? white : darkBackground,
        appBar: AppBar(
          backgroundColor: isLight ? white : darkBackground,
          shape: Border(
            bottom: BorderSide(
              color: isLight ? primary : white,
              width: 1.6,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Chats',
              style: TextStyle(
                color: isLight ? primary : white,
                fontSize: 24,
                fontFamily: 'IrishGrover',
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) => ChatListItem(
            name: 'BEE cakes',
            onTap: () {},
            imageUrl: '',
          ),
          itemCount: 10,
        ));
  }
}
