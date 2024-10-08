import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static const String _key = 'key';
  static const String _counter = 'counter';
  static const String _isAdmin = 'isAdmin';

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Get name
  static Future<String> getName() async {
    final prefs = await _prefs;
    return prefs.getString('displayName') ?? '';
  }

  // Get email
  static Future<String> getEmail() async {
    final prefs = await _prefs;
    return prefs.getString('email') ?? '';
  }

  // Read data (key, counter, isAdmin)
  static Future<void> readData() async {
    final prefs = await _prefs;
    final keyValue = prefs.getString(_key);
    final counterValue = prefs.getInt(_counter);
    final isAdminValue = prefs.getBool(_isAdmin);

    print('Key: $keyValue');
    print('Counter: $counterValue');
    print('Is Admin: $isAdminValue');
  }

  // Save data (displayName, email)
  static Future<void> saveData(String displayName, String email) async {
    final prefs = await _prefs;
    await prefs.setString('displayName', displayName);
    await prefs.setString('email', email);
  }
}