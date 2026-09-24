import 'package:app_noticias/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Portal de Notícias',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(255, 255, 255, 1)),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 4.0,
        
      ),
      ),
    home: const HomePage(),
  ));
}