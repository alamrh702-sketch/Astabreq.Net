import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AstabreqNetApp());
}

class AstabreqNetApp extends StatelessWidget {
  const AstabreqNetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astabreq.Net',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
