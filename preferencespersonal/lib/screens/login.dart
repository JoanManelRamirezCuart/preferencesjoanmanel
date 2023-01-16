import 'package:flutter/material.dart';
import 'package:preferences_app/preferences/preferences.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:provider/provider.dart';

class LoguinScreen extends StatefulWidget {
  static const String routerName = 'login';

  const LoguinScreen({Key? key}) : super(key: key);

  @override
  State<LoguinScreen> createState() => _LoguinScreenState();
}

class _LoguinScreenState extends State<LoguinScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    String _nomaguardar = "";
    String _contraaguardar = "";
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Text('Login',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.nom,
                    onChanged: (value) {
                      Preferences.nom = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: 'Nom', helperText: 'Nom de l\'usuari'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.contra,
                    onChanged: (value) {
                      Preferences.contra = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: 'Clau', helperText: 'Clau del usuari'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.fotoperf,
                    onChanged: (value) {
                      Preferences.fotoperf = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText:
                            'Foto (primer mirar amem si funciona perfavor)',
                        helperText: 'Ruta foto perfil'),
                  ),
                ),
                SwitchListTile(
                    value: Preferences.isDarkmode,
                    title: const Text('Dark Mode'),
                    onChanged: (value) {
                      Preferences.isdarkmode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      value
                          ? themeProvider.setDarkmode()
                          : themeProvider.setLightMode();
                      setState(() {});
                    }),
                const Divider(),
                Center(
                  child: ElevatedButton(
                    child: Text("LOGIN"),
                    onPressed: () {
                      if (Preferences.nom.length == 0) {
                        Preferences.nom = 'No deixis coses amb blanc';
                        setState(() {});
                      }
                      if (Preferences.fotoperf.length == 0) {
                        Preferences.fotoperf =
                            'https://i.pinimg.com/originals/d8/61/f9/d861f922f1ccada028800c55e01f9697.jpg';
                        setState(() {});
                      }
                      Preferences.pantalla = "okn";
                      setState(() {});
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routerName);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
