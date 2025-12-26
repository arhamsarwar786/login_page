import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isLoggedIn = false;
  bool _rememberMe = false;
  String _currentLanguage = 'en';

  bool get isDarkMode => _isDarkMode;
  bool get isLoggedIn => _isLoggedIn;
  bool get rememberMe => _rememberMe;
  String get currentLanguage => _currentLanguage;

  static const String _darkModeKey = 'isDarkMode';
  static const String _loggedInKey = 'isLoggedIn';
  static const String _rememberMeKey = 'rememberMe';
  static const String _languageKey = 'selectedLanguage';

  ThemeProvider() {
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    await loadTheme();
    await loadLoginState();
    await loadRememberMe();
    await loadLanguage();
  }

  Future<void> switchTheme() async {
    _isDarkMode = !_isDarkMode;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(_darkModeKey, _isDarkMode);
    notifyListeners();
  }

  Future<void> loadTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isDarkMode = pref.getBool(_darkModeKey) ?? false;
    notifyListeners();
  }

  Future<void> setLoggedIn(bool value) async {
    _isLoggedIn = value;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(_loggedInKey, value);
    notifyListeners();
  }

  Future<void> loadLoginState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isLoggedIn = pref.getBool(_loggedInKey) ?? false;
    notifyListeners();
  }

  Future<void> setRememberMe(bool value) async {
    _rememberMe = value;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(_rememberMeKey, value);
    notifyListeners();
  }

  Future<void> loadRememberMe() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _rememberMe = pref.getBool(_rememberMeKey) ?? false;
    notifyListeners();
  }

  // Language change method
  Future<void> changeLanguage(String languageCode) async {
    _currentLanguage = languageCode;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(_languageKey, languageCode);
    notifyListeners();
  }

  // Load saved language
  Future<void> loadLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _currentLanguage = pref.getString(_languageKey) ?? 'en';
    notifyListeners();
  }

  Future<void> login({required bool rememberMe}) async {
    await setLoggedIn(true);
    await setRememberMe(rememberMe);
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _rememberMe = false;
    
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(_loggedInKey);
    await pref.remove(_rememberMeKey);
    
    notifyListeners();
  }

  bool shouldAutoLogin() {
    return _isLoggedIn && _rememberMe;
  }

  Future<void> clearAllData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    
    _isDarkMode = false;
    _isLoggedIn = false;
    _rememberMe = false;
    _currentLanguage = 'en';
    
    notifyListeners();
  }
  void notifyLanguageChange() {
    notifyListeners();
  }
}