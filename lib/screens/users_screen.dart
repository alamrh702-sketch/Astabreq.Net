import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C3483),
        title: const Text('إضافة مشترك جديد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // حقل اسم المشترك
            TextField(
              decoration: InputDecoration(
                labelText: 'اسم المشترك الكامل',
                prefixIcon: const Icon(Icons.person, color: Color(0xFF6C3483)),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // حقل رقم الهاتف
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'رقم الهاتف (مثال: 07700000000)',
                prefixIcon: const Icon(Icons.phone, color: Color(0xFF6C3483)),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // حقل العنوان أو الموقع
            TextField(
              decoration: InputDecoration(
                labelText: 'العنوان / المنطقة',
                prefixIcon: const Icon(Icons.location_on, color: Color(0xFF6C3483)),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // اختيار الباقة (Dropdown وهمي أو تصميم مرتب)
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'اختر الباقة',
                prefixIcon: const Icon(Icons.wifi, color: Color(0xFF6C3483)),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              items: ['باقة 25 ألف', 'باقة 35 ألف', 'باقة 50 ألف']
                  .map((package) => DropdownMenuItem(
                        value: package,
                        child: Text(package),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 30),

            // زر الحفظ
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C3483),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // هنا راح نربطه بقاعدة البيانات أو سيرفر الـ SAS لاحقاً
                },
                child: const Text(
                  'حفظ وإضافة المشترك',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SubscribersScreen extends StatelessWidget {
  const SubscribersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C3483),
        title: const Text('قائمة المشتركين', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // شريط البحث
            TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن مشترك أو رقم الهاتف...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF6C3483)),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            // فلترة المشتركين (الكل، أونلاين، منتهي)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildFilterChip('الكل', true),
                  buildFilterChip('أونلاين', false),
                  buildFilterChip('فعال', false),
                  buildFilterChip('منتهي', false),
                  buildFilterChip('طافي', false),
                ],
              ),
            ),
            const SizedBox(height: 12),
            
            // قائمة المشتركين
            Expanded(
              child: ListView(
                children: [
                  buildSubscriberCard('أحمد علي', '07700000000', 'باقة 35 ألف', 'أونلاين', true, Colors.green),
                  buildSubscriberCard('حسين كريم', '07800000000', 'باقة 25 ألف', 'طافي', false, Colors.grey),
                  buildSubscriberCard('مصطفى جاسم', '07500000000', 'باقة 50 ألف', 'منتهي الاشتراك', false, Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: Chip(
        label: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black87)),
        backgroundColor: isSelected ? const Color(0xFF6C3483) : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }

  Widget buildSubscriberCard(String name, String phone, String package, String status, bool isOnline, Color statusColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isOnline ? Colors.green.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
          child: Icon(isOnline ? Icons.wifi : Icons.wifi_off, color: isOnline ? Colors.green : Colors.grey),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$phone • $package'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status,
            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
