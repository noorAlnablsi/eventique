//taghreed
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
        body: ListView.builder(
          itemBuilder: (ctx, i) => ChatListItem(
            name: vendorData[i].name,
            vendorId: vendorData[i].id,
            imageUrl: vendorData[i].imageUrl!,
          ),
          itemCount: vendorData.length,
        ));
  }
}
