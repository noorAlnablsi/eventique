import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '/main.dart';
import '/shared_preferences/storage_manager.dart';

class Auth with ChangeNotifier {
  String _signUpToken = '';
  String _loginToken = '';
  int _userId = 0;
  var _userData = {
    'userName': '',
    'userEmail': '',
    'userPassword': '',
    'userImage': '',
  };

  // Auth() {
  //   _loadUserData();
  // }

  String get token {
    if (_loginToken.isNotEmpty) {
      return _loginToken;
    }
    return '';
  }

  int get userId {
    if (_userId != 0) {
      return _userId;
    }
    return -1;
  }

  bool get isAuth {
    return _loginToken != '';
  }

  Map<String, String> get userData {
    return {..._userData};
  }

  // Future<void> _loadUserData() async {
  //   Map<String, String?> userData = await StorageManager.loadUserData();
  //   _signUpToken = userData['signUpToken'] ?? '';
  //   _loginToken = userData['loginToken'] ?? '';
  //   _userData['userName'] = userData['userName'] ?? '';
  //   _userData['userEmail'] = userData['userEmail'] ?? '';
  //   _userData['userImage'] = userData['userImage'] ?? '';
  //   notifyListeners();
  // }

  // Future<void> _saveUserData() async {
  //   await StorageManager.saveUserData(
  //     _signUpToken,
  //     _loginToken,
  //     _userData['userName']!,
  //     _userData['userEmail']!,
  //     _userData['userImage']!,
  //   );
  // }

  Future<void> signUp(
    String imageUrl,
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    final url = Uri.parse('$host/api/register');
    print(url);
    try {
      final response = await http.post(
        url,
        headers: {'Accept': 'application/json'},
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword
        },
      );
      final responseData = json.decode(response.body);
      print(responseData);

      if (responseData == null) {
        throw Exception();
      }
      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }

      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error; //to handle it in ui
    }
  }

  Future<void> signUpVerificationCode(String email, String code) async {
    final url = Uri.parse('$host/api/verRegistereOTP');
    print(url);
    print('$code+++++++++++++++++');
    try {
      final response = await http.post(
        url,
        headers: {'Accept': 'application/json'},
        body: {
          "email": email,
          "code": code,
        },
      );

      // Log the status code and response body for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception('Failed to load data: ${response.statusCode}');
      }

      if (response.body.isEmpty) {
        throw FormatException('Empty response body');
      }

      final responseData = json.decode(response.body);
      print("This is the response: $responseData");

      if (responseData == null) {
        throw Exception('Response data is null');
      }

      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }
      _signUpToken = responseData['signUpToken'];
      _loginToken = responseData['loginToken'];
      _userId = responseData['userId'];
      _userData['userName'] = responseData['name'];
      _userData['userEmail'] = responseData['email'];
      _userData['userPassword'] = responseData['password'];
      _userData['userImage'] = responseData['image'];
      print(_userData['userEmail']);
      // await _saveUserData();
      notifyListeners();
    } catch (error) {
      print("Error occurred: ${error.toString()}");
      throw (error);
    }
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse('$host/api/login');
    print(_signUpToken);
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_signUpToken',
        },
        body: {
          'email': email,
          'password': password,
        },
      );
      final responseData = json.decode(response.body);

      print(responseData);
      if (responseData == null) {
        throw Exception();
      }
      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }
      _loginToken = responseData['loginToken'];
      _userData['userName'] = responseData['name'];
      _userData['userEmail'] = responseData['email'];
      _userData['userPassword'] = responseData['password'];
      _userData['userImage'] = responseData['image'];
      // await _saveUserData();
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw (error);
    }
  }

  Future<void> forgetVerificationCode(String email, String code) async {
    final url = Uri.parse('$host/api/verAuthOTP');
    print(url);
    print('$code+++++++++++++++++');
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_signUpToken',
        },
        body: {
          'email': email,
          'code': code,
        },
      );
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData == null) {
        throw Exception();
      }
      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw (error);
    }
  }

  Future<void> RestVerificationCode(String email, String code) async {
    final url = Uri.parse('$host/api/verAuthOTP');
    print(url);
    print('$code+++++++++++++++++');
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_signUpToken',
        },
        body: {
          'email': email,
          'code': code,
        },
      );
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData == null) {
        throw Exception();
      }
      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> emailForgetPassword(String email) async {
    final url = Uri.parse('$host/api/sendOTP');
    try {
      final response = await http.post(
        url,
        headers: {'Accept': 'application/json'},
        body: {
          'email': email,
        },
      );

      final responseData = json.decode(response.body);

      print(responseData);
      if (responseData == null) {
        throw Exception();
      }
      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> newPassword(
      String email, String password, String confirmPassword) async {
    final url = Uri.parse('$host/api/resetPass');
    print(url);
    print(
        'password:$password andddddddddddddddddddd confirmPassword:$confirmPassword');
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_signUpToken',
        },
        body: {
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );
      final responseData = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      print(responseData);
      if (responseData == null) {
        throw Exception();
      }
      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> updateUserImage(String newImageUrl) async {
    final url = Uri.parse('$host/api/updateImage'); // Example endpoint
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_loginToken',
        },
        body: {
          'user_id': _userId.toString(), // Send user ID or any required data
          'image': newImageUrl,
        },
      );

      final responseData = json.decode(response.body);

      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }

      // Update local user data
      _userData['userImage'] = newImageUrl;
      await StorageManager.saveData('userImage', newImageUrl);
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error; // Re-throw the error for handling in UI
    }
  }

  Future<void> updateUserName(String newName) async {
    final url = Uri.parse('$host/api/updateUserName'); // Example endpoint
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_loginToken',
        },
        body: {
          'user_id': _userId.toString(),
          'name': newName,
        },
      );

      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }

      // Update local user data
      _userData['userName'] = newName;
      await StorageManager.saveData('userName', newName);
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error; // Re-throw the error for handling in UI
    }
  }

  Future<void> passwordRest(
      String oldPassword, String password, String confirmPassword) async {
    final url = Uri.parse('$host/api/RestPassword'); // Example endpoint
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_loginToken',
        },
        body: {
          'user_id': _userId.toString(),
          'old_password': oldPassword,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );

      final responseData = json.decode(response.body);

      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }

      // Update local user data
      _userData['password'] = password;
      await StorageManager.saveData('userPassword', password);
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error; // Re-throw the error for handling in UI
    }
  }

  Future<void> emailRest(String newEmail) async {
    final url = Uri.parse('$host/api/updateUserEmail'); // Example endpoint
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_loginToken',
        },
        body: {
          'user_id': _userId.toString(),
          'email': newEmail,
        },
      );

      final responseData = json.decode(response.body);

      if (responseData['Status'] == 'Failed') {
        throw Exception(responseData['Error']);
      }

      // Update local user data
      _userData['userEmail'] = newEmail;
      await StorageManager.saveData('userEmail', newEmail);
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error; // Re-throw the error for handling in UI
    }
  }

//this may need edit
  Future<void> sendUserToBackend(User user, String provider) async {
    final url = Uri.parse('$host/api/register-social-user');
    try {
      final idToken = await user.getIdToken();

      final response = await http.post(
        url,
        headers: {'Accept': 'application/json'},
        body: {
          'name': user.displayName ?? '',
          'email': user.email ?? '',
          'provider': provider,
          'provider_id': user.uid,
          'token': idToken,
          'profile_picture': user.photoURL ?? '',
        },
      );

      final responseData = json.decode(response.body);
      if (responseData['status'] == 'failed') {
        throw Exception(responseData['error']);
      }

      // Handle response data as needed
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw ('Google sign-in was canceled.');
        // The user canceled the sign-in
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      if (googleAuth == null) {
        // Authentication failed
        throw ('Google authentication failed.');
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Extract user information
      final User? user = userCredential.user;
      if (user != null) {
        final String username = user.displayName ?? '';
        final String email = user.email ?? '';
        final String imageUrl = user.photoURL ?? '';

        // Store user information in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid) // Use user.uid as the document ID
            .set({
          'username': username,
          'email': email,
          'image_url': imageUrl,
        });
        _userData['userName'] = username;
        _userData['userEmail'] = email;
        _userData['userImage'] = imageUrl;
        print(_userData['userName']);
        print(_userData['userEmail']);
        print(_userData['userImage']);
        // Show success message and navigate
        notifyListeners();
      }
      // Once signed in, return the UserCredential
      return userCredential;
    } catch (error) {
      print("$error--------------------------");
      throw (error);
    }
  }

  Future<void> logout() async {}
}
