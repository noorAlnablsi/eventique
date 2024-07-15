import '/color.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '/screens/home_screen.dart';
import '/providers/auth_provider.dart';

class MyDivider extends StatefulWidget {
  const MyDivider({super.key});

  @override
  State<MyDivider> createState() => _MyDividerState();
}

class _MyDividerState extends State<MyDivider> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoading = false;
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Google sign in completed successfully.'),
          backgroundColor: primary,
        ),
      );
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print('${error}+++++++++++++++++++++++++++++++++++++++++++++++++++++');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('An error occurred with Google sign-in. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  // Future<UserCredential?> signInWithFacebook() async {
  //   try {
  //     // Trigger the sign-in flow
  //     final LoginResult? loginResult = await FacebookAuth.instance.login();

  //     // Create a credential from the access token
  //     final OAuthCredential? facebookAuthCredential =
  //         FacebookAuthProvider.credential(
  //             loginResult!.accessToken!.tokenString);

  //     // Once signed in, return the UserCredential
  //     return FirebaseAuth.instance
  //         .signInWithCredential(facebookAuthCredential!);
  //   } catch (error) {
  //     print(error);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //             'An error occurred with Facebook sign-in. Please try again.'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return null;
  //   }
  // }

  Future<void> handleSignIn(User? user, String provider) async {
    if (user != null) {
      try {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<Auth>(context, listen: false)
            .sendUserToBackend(user, provider);
        setState(() {
          _isLoading = false;
        });
        // Navigate to home screen or wherever you need to
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        print(error);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          //cleancode??
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13),
                height: 1,
                color: Color.fromARGB(255, 42, 44, 87),
              ),
            ),
            Text(
              "or",
              style: TextStyle(
                  color: Color.fromARGB(255, 42, 44, 87),
                  fontFamily: 'Quattrocento',
                  fontSize: 16),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13),
                height: 1,
                color: Color.fromARGB(255, 42, 44, 87),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: 'unique tag1',
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Color.fromARGB(255, 42, 44, 87),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                UserCredential? userCredential = await signInWithGoogle();
                User? user = userCredential!.user;
                await handleSignIn(user, 'google');
                ;
                setState(() {
                  _isLoading = false;
                });
              },
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SvgPicture.asset("assets/images/google-icon logo.svg"),
            ),
            SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              heroTag: 'unique tag2',
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Color.fromARGB(255, 42, 44, 87),
                ),
              ),
              onPressed: () async {
                // setState(() {
                //   _isLoading = true;
                // });
                // UserCredential? userCredential = await signInWithFacebook();
                // User? user = userCredential!.user;
                // await handleSignIn(user, 'facebook');

                // setState(() {
                //   _isLoading = false;
                // });
              },
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SvgPicture.asset("assets/images/Facebook logo.svg"),
            )
          ],
        )
      ],
    );
  }
}

//we may use this
//  Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               User? user = await signInWithGoogle();
//               if (user != null) {
//                 // Successfully signed in
//                 print("User signed in: ${user.displayName}");
//               }
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: primary,
//               fixedSize: Size(size.width * 0.8, size.height * 0.06),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SvgPicture.asset("assets/images/google-icon logo.svg"),
//                 Text(
//                   "Continue  with Google",
//                   style: TextStyle(
//                     fontFamily: 'CENSCBK',
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),