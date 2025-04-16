import 'package:flutter/material.dart';
import 'package:practice_3/data/constant.dart';
import 'package:practice_3/data/notifiers.dart';
import 'package:practice_3/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  void initThemeMode()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(Kconstant.themeModeKey);
    isDarkNotifier.value = repeat ?? false;
  }
  @override
  Widget build(BuildContext context){
    return ValueListenableBuilder(valueListenable: isDarkNotifier,
        builder: (context, isDarkMode , child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,
                brightness: isDarkMode ? Brightness.dark : Brightness.light)),
            home: WelcomePage(),
          );
        }
    );
  }
}

