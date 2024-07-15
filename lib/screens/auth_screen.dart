import 'dart:io';

import '/color.dart';
import '/providers/auth_provider.dart';
import '/models/verifications_arguments.dart';
import '/screens/home_screen.dart';
import '/screens/verification_screen.dart';
import '/widgets/auth/auth_form.dart';
import '/widgets/auth/circular_shape.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  Future<void> _submitAuthForm(
    String email,
    String username,
    String password,
    String confirmPassword,
    File? image,
    bool isLogin,
    BuildContext ctx,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });

      if (isLogin) {
        await Provider.of<Auth>(context, listen: false).login(email, password);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      } else {
        //this is the code to upload an image to fire storage
        String? imageURL;
        if (image != null) {
          final ref = FirebaseStorage.instance
              .ref()
              .child('user_${username}_image')
              .child('$email.jpg');
          await ref.putFile(image);
          imageURL = await ref.getDownloadURL();
          print(imageURL);
        }

        await Provider.of<Auth>(context, listen: false).signUp(
          imageURL ?? '',
          username,
          email,
          password,
          confirmPassword,
        );

        Navigator.of(context).pushNamed(
          VerificationScreen.routeName,
          arguments: VerificationArguments(
            email: email,
            type: 'signup',
          ),
        );
      }
    } catch (error) {
      print(error.toString());
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: size.height * 0.75,
              width: double.infinity,
              color: primary,
            ),
          ),
          AuthForm(_submitAuthForm, _isLoading),
        ],
      ),
    );
  }
}
