import 'package:flutter/material.dart';
import 'package:poke_dex_projesi/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Genel",
        primarySwatch: Colors.grey
      ),
      title: 'Material App',
      home: Homepage(),
      );
  }
}