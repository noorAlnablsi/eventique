import 'package:eventique/providers/vendors_provider.dart';
import 'package:eventique/screens/chat_vendors_list.dart';
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

const String host = 'http://192.168.43.184:8000';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: VendorsProvider(),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'EvenTique',
          // theme: themeProvider.lightTheme,
          // darkTheme: themeProvider.darkTheme,
          themeMode: themeProvider.getThemeMode(),
          debugShowCheckedModeBanner: false,
          home: AuthScreen(),
          routes: {
            VerificationScreen.routeName: (ctx) => VerificationScreen(),
            EnterEmailScreen.routeName: (ctx) => EnterEmailScreen(),
            NewPasswordScreen.routeName: (ctx) => NewPasswordScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            ChatVendorsListScreen.routeName: (ctx) => ChatVendorsListScreen(),
            ChatScreen.routeName: (ctx) => ChatScreen(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
            PasswordRestScreen.routeName: (ctx) => PasswordRestScreen(),
            EmailRestScreen.routeName: (ctx) => EmailRestScreen(),
            SettingsScreen.routeName: (ctx) => SettingsScreen(),
          },
        ),
      ),
    );
  }
}
