import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  // Keys
  static const String _keyBearerToken = "bearerToken";
  static const String _keyUserId = "userId";
  static const String _keyUsername = "username";
  static const String _keySlot = "slot";

  // Save slot
  static Future<void> saveSlot(String slot) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keySlot, slot);
  }

  // Get slot
  static Future<String?> getSlot() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keySlot);
  }

  /// Save bearer token
  static Future<void> saveBearerToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyBearerToken, token);
  }

  /// Get bearer token
  static Future<String?> getBearerToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyBearerToken);
  }

  /// Save user ID
  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserId, userId);
  }

  /// Get user ID
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserId);
  }

  /// Save username
  static Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
  }

  /// Get username
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  /// Remove a specific key
  static Future<void> removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  /// Clear all keys
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  /// Check if user is logged in
  static Future<bool> isUserLoggedIn() async {
    final token = await getBearerToken();
    return token != null && token.isNotEmpty;
  }

  static Future<String?> getDeviceToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcm_token');
  }
}
