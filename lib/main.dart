import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أستبرق لخدمات الانترنت'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(Icons.wifi, size: 50, color: Colors.blueAccent),
                    SizedBox(height: 10),
                    Text(
                      'نظام إدارة المشتركين والديون',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text('estabreq.org', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.people),
              label: const Text('إدارة المشتركين'),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.monetization_on),
              label: const Text('تسجيل الديون والحسابات'),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
            ),
          ],
        ),
      ),
    );
  }
}
