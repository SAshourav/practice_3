import 'package:flutter/material.dart';
import 'package:practice_3/data/notifiers.dart';
import 'package:practice_3/views/pages/welcome_page.dart';
import 'package:practice_3/views/widget_tree.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

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

