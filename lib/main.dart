import 'package:flutter/material.dart';
import 'package:tv_maze/views/home/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        scaffoldBackgroundColor: const Color.fromARGB(255, 1, 1, 1),
        elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 130, 194, 188)),
                textStyle:
                    MaterialStatePropertyAll(TextStyle(color: Colors.white)))),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
