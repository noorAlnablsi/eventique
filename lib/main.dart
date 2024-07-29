// ignore_for_file: prefer_const_constructors

import 'package:eventique/providers/accepted_services.dart';
import 'package:eventique/providers/saved.dart';
import 'package:eventique/providers/share_event_provider.dart';
import 'package:eventique/providers/vendors_provider.dart';
import 'package:eventique/providers/wallet_provider.dart';
import 'package:eventique/screens/chat_vendors_list.dart';
import 'package:eventique/providers/home_provider.dart';
import 'package:eventique/providers/carts.dart';
import 'package:eventique/providers/events.dart';
import 'package:eventique/providers/orders.dart';
import 'package:eventique/providers/reviews.dart';
import 'package:eventique/providers/services_list.dart';
import 'package:eventique/screens/navigation_bar_page.dart';
import 'package:eventique/screens/one_package_details.dart';
import 'package:eventique/screens/one_you&us.dart';
import 'package:eventique/screens/share_event_screen.dart';
import 'package:eventique/screens/wallet_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import '/providers/theme_provider.dart';
import '/providers/auth_provider.dart';
import '/screens/auth_screen.dart';
import '/screens/enter_email_screen.dart';
import '/screens/home_screen.dart';
import '/screens/new_password_screen.dart';
import '/screens/verification_screen.dart';
import '/screens/chats_screen.dart';
import '/screens/profile_screen.dart';
import '/screens/settings_screen.dart';
import '/screens/email_rest_screen.dart';
import '/screens/password_rest_screen.dart';
import '/screens/vendor_profile_screen.dart';

const String host = 'http://192.168.1.9:8000';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authProvider = Auth();
  await authProvider.loadUserData();

  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: MyApp(authProvider: authProvider),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Auth authProvider;

  MyApp({super.key, Auth? authProvider})
      : authProvider = authProvider ?? Auth();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final token = authProvider.token;
    final id = authProvider.userId;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: authProvider,
        ),
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: VendorsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AllServices(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Reviews(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Carts(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(token, id),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Events(token),
        ),
        ChangeNotifierProvider.value(
          value: Saved(token),
        ),
        ChangeNotifierProvider.value(
          value: AcceptedServicesPro(),
        ),
        ChangeNotifierProvider.value(
          value: WalletProvider(token, id),
        ),
        ChangeNotifierProvider.value(
          value: ShareEventProvider(token),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'EvenTique',
          themeMode: themeProvider.getThemeMode(),
          debugShowCheckedModeBanner: false,
          home: auth.isAuthenticated ? NavigationBarPage() : AuthScreen(),
          //home: WalletScreen(),
          routes: {
            AuthScreen.routeName: (ctx) => AuthScreen(),
            VerificationScreen.routeName: (ctx) => VerificationScreen(),
            EnterEmailScreen.routeName: (ctx) => EnterEmailScreen(),
            NewPasswordScreen.routeName: (ctx) => NewPasswordScreen(),
            NavigationBarPage.routeName: (context) => NavigationBarPage(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            ChatVendorsListScreen.routeName: (ctx) => ChatVendorsListScreen(),
            ChatScreen.routeName: (ctx) => ChatScreen(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
            VendorProfileScreen.routeName: (ctx) => VendorProfileScreen(),
            PasswordRestScreen.routeName: (ctx) => PasswordRestScreen(),
            EmailRestScreen.routeName: (ctx) => EmailRestScreen(),
            SettingsScreen.routeName: (ctx) => SettingsScreen(),
            ShareEventScreen.routeName: (ctx) => ShareEventScreen(),
            OnePackageDetailsPage.routeName: (ctx) => OnePackageDetailsPage(),
            YouAndUsPage.routeName: (ctx) => YouAndUsPage(),
            WalletScreen.routeName: (ctx) => WalletScreen(),
          },
        ),
      ),
    );
  }
}
