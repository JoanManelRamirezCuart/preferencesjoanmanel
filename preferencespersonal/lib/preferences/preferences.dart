import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _nom = "";
  static bool _isdarkmode = false;
  static int _genere = 1;
  static String _contra = "";
  static String _fotoperfil = "";
  static String _pantalla = "ok";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get nom {
    return _prefs.getString("nom") ?? _nom;
  }

  static set nom(String value) {
    _nom = nom;
    _prefs.setString('nom', value);
  }

  static String get pantalla {
    return _prefs.getString("pantalla") ?? _pantalla;
  }

  static set pantalla(String value) {
    _prefs.setString('pantalla', value);
  }

  static String get contra {
    return _prefs.getString("contra") ?? _contra;
  }

  static set contra(String value) {
    _contra = contra;
    _prefs.setString('contra', value);
  }

  static String get fotoperf {
    return _prefs.getString("fotoperf") ?? _fotoperfil;
  }

  static set fotoperf(String value) {
    _fotoperfil = fotoperf;
    _prefs.setString('fotoperf', value);
  }

  static bool get isDarkmode {
    return _prefs.getBool("darkmode") ?? _isdarkmode;
  }

  static set isdarkmode(bool value) {
    _isdarkmode = isDarkmode;
    _prefs.setBool('darkmode', value);
  }
}
