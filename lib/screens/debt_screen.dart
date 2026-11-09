import 'package:flutter/material.dart';

class DebtBookScreen extends StatelessWidget {
  const DebtBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C3483),
        title: const Text('دفتر الديون والحسابات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // بطاقة الملخص المالي
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF6C3483),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('إجمالي الديون المعلقة', style: TextStyle(color: Colors.white70, fontSize: 14)),
                      SizedBox(height: 5),
                      Text('150,000 د.ع', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Icon(Icons.account_balance_wallet, color: Colors.white, size: 40),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // قائمة الديون للمشتركين
            Expanded(
              child: ListView(
                children: [
                  buildDebtCard('أحمد علي', '35,000 د.ع', 'متبقي من اشتراك الشهر الماضي', Colors.orange),
                  buildDebtCard('حسين كريم', '25,000 د.ع', 'قيمة الباقة الجديدة', Colors.red),
                  buildDebtCard('محمد جاسم', '90,000 د.ع', 'دين قديم', Colors.purple),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDebtCard(String name, String amount, String note, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(Icons.money_off, color: color),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(note),
        trailing: Text(
          amount,
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
