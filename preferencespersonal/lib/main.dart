import 'package:flutter/material.dart';
import 'package:preferences_app/preferences/preferences.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/home_screen.dart';
import 'package:preferences_app/screens/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var panta;
    if (Preferences.pantalla == "ok") {
      panta = LoguinScreen.routerName;
    } else {
      panta = HomeScreen.routerName;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: panta,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        LoguinScreen.routerName: (_) => const LoguinScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
