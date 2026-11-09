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
