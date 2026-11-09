import 'package:flutter/material.dart';

class DebtScreen extends StatelessWidget {
  const DebtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الديون'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('هنا تظهر تفاصيل الديون والحسابات', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
