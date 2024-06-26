import 'package:flutter/material.dart';
import 'package:flutter_application_1/shaker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "Times",
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 7, 16, 71),
              titleTextStyle: TextStyle(
                  fontFamily: "Times",
                  color: Color.fromARGB(255, 186, 233, 255),
                  fontSize: 22))),
      home: const MyHomePage(),
    );
  }
}
