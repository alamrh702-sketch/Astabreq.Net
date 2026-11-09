import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // متغيرات تخزين البيانات القادمة من السيرفر
  String totalUsers = "...";
  String activeUsers = "...";
  String offlineUsers = "...";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData(); // جلب البيانات أول ما يفتح التطبيق
  }

  // دالة الاتصال بالدومين وجلب الإحصائيات
  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://estabreq.org/stats.php'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          totalUsers = data['total_users'].toString();
          activeUsers = data['active_users'].toString();
          offlineUsers = data['offline_users'].toString();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("خطأ بالاتصال: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C3483),
        title: const Text('لوحة التحكم - Astabreq.Net', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() { isLoading = true; });
              fetchData(); // زر لتحديث البيانات يدوياً
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF6C3483)))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // بطاقة المشتركين الكلية
                  buildStatCard('إجمالي المشتركين', totalUsers, Icons.people, Colors.blue),
                  const SizedBox(height: 12),
                  // المشتركين الفعالين (أونلاين)
                  buildStatCard('المشتركين الفعالين', activeUsers, Icons.wifi, Colors.green),
                  const SizedBox(height: 12),
                  // المشتركين المنتهين أو الطافيين
                  buildStatCard('المنتهين / الطافيين', offlineUsers, Icons.wifi_off, Colors.red),
                ],
              ),
            ),
    );
  }

  Widget buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(value, style: TextStyle(color: color, fontSize: 26, fontWeight: FontWeight.bold)),
            ],
          ),
          CircleAvatar(
            backgroundColor: color.withOpacity(0.15),
            radius: 28,
            child: Icon(icon, color: color, size: 30),
          ),
        ],
      ),
    );
  }
}
