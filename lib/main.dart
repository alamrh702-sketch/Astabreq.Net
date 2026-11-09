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
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFFF7F6FB),
        useMaterial3: true,
      ),
      home: const ResellerLoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 1. شاشة تسجيل الدخول والربط بالرسيلر
class ResellerLoginScreen extends StatefulWidget {
  const ResellerLoginScreen({super.key});

  @override
  State<ResellerLoginScreen> createState() => _ResellerLoginScreenState();
}

class _ResellerLoginScreenState extends State<ResellerLoginScreen> {
  final _domainController = TextEditingController();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  bool _isLoading = false;

  void _syncData() {
    if (_domainController.text.isEmpty || _userController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال الدومين ومعلومات الحساب')),
      );
      return;
    }

    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainDashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ربط حساب الرسيلر - استبرق نت'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.router, size: 80, color: Colors.deepPurple),
                const SizedBox(height: 20),
                const Text(
                  'أهلاً بك، يرجى إدخال معلومات سيرفر الرسيلر للمزامنة:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _domainController,
                  decoration: const InputDecoration(
                    labelText: 'رابط الدومين (URL)',
                    hintText: 'monitor.salamdelivery.app',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.link),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: 'اسم المستخدم (Username)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور (Password)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _isLoading ? null : _syncData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('مزامنة واستخراج البيانات', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 2. الواجهة الرئيسية (Dashboard)
class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.wifi_tethering, size: 28),
                SizedBox(width: 8),
                Text('سلام نت', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.check_circle, size: 14, color: Colors.white),
                  SizedBox(width: 4),
                  Text('متصل', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: [
                _buildStatCard('فعالين', '12', Icons.verified, Colors.green, Colors.green.shade50),
                _buildStatCard('كل المشتركين', '17', Icons.groups, Colors.deepPurple, Colors.deepPurple.shade50),
                _buildStatCard('طافيين', '16', Icons.power_settings_new, Colors.blueGrey, Colors.blueGrey.shade50),
                _buildStatCard('أون لاين', '1', Icons.wifi, Colors.lightBlue, Colors.lightBlue.shade50),
                _buildStatCard('ينتهي باجر', '0', Icons.calendar_today, Colors.amber.shade800, Colors.amber.shade50),
                _buildStatCard('ينتهي اليوم', '0', Icons.alarm, Colors.orange, Colors.orange.shade50),
                _buildStatCard('يحتاج متابعة', '0', Icons.assignment, Colors.pink, Colors.pink.shade50),
                _buildStatCard('منتهي الاشتراكات', '0', Icons.cancel, Colors.red, Colors.red.shade50),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('مراقبة الأجهزة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('61 جهاز', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                        child: const Text('سليم 61', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(8)),
                        child: const Text('ماكو بنغ 0', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.wifi), label: 'المراقبة'),
          BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'الأجهزة'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'التنبيهات'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon, Color color, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
              Icon(icon, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(count, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
