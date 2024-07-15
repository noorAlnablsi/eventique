import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  // Save data based on its type
  static Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  // Read data from shared preferences
  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key); // This returns the dynamic type
  }

  // Delete data from shared preferences
  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  // Save user data as key-value pairs
  static Future<void> saveUserData(String signUpToken, String loginToken,
      String userName, String userEmail, String userImage) async {
    await saveData('signUpToken', signUpToken);
    await saveData('loginToken', loginToken);
    await saveData('userName', userName);
    await saveData('userEmail', userEmail);
    await saveData('userImage', userImage);
  }

  // Load user data
  static Future<Map<String, String?>> loadUserData() async {
    String? signUptoken = await readData('signUpToken');
    String? loginToken = await readData('loginToken');
    String? userName = await readData('userName');
    String? userEmail = await readData('userEmail');
    String? userImage = await readData('userImage');

    return {
      'signUpToken': signUptoken,
      'loginToken': loginToken,
      'userName': userName,
      'userEmail': userEmail,
      'userImage': userImage,
    };
  }
}
