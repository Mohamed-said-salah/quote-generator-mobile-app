import 'package:flutter/material.dart';
import 'package:quote_generator_mobiel_app/pages/favorite_page.dart';
import 'package:quote_generator_mobiel_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      theme: ThemeData(
        fontFamily: "Gemunu Libre",
      ),
      routes: {
        HomePage.homeRoute: (context) => const HomePage(),
        FavoritePage.favoriteRoute: (context) => const FavoritePage(),
      },
      home: const HomePage(),
    );
  }
}
