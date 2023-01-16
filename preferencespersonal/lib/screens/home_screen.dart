import 'package:flutter/material.dart';
import 'package:preferences_app/preferences/preferences.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/home_screen.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {});

    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil de: ${Preferences.nom}'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(Preferences.fotoperf),
                maxRadius: 100,
              ),
              Divider(),
              Text('Nom d\'usuari : ${Preferences.nom}'),
              Divider(),
              Center(
                child: ElevatedButton(
                  child: Text("Log out"),
                  onPressed: () {
                    Preferences.pantalla = "ok";
                    setState(() {});
                    Navigator.pop(context);
                    Navigator.pushNamed(context, LoguinScreen.routerName);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
