import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  final String _kIsLogged = "isLogged";
  final String _kName = "name";

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    
    return _instance;
  }

  set logged(bool logged) => _preferences.setBool(_kIsLogged, logged);
  bool get isLogged => _preferences.getBool(_kIsLogged) ?? false;

  set name(String name) => _preferences.setString(_kName, name);
  String get name => _preferences.getString(_kName) ?? "Indefinido";
}