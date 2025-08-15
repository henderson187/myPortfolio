
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faizan Saddique - Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
