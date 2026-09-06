import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: DashboardPage()));

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // ขั้นที่ 1: การ์ดสถิติ 4 ใบ
  final List<Map<String, String>> stats = const [
    {'title': 'ยอดขาย', 'value': '150,000 บาท'},
    {'title': 'ผู้ใช้', 'value': '1,250 คน'},
    {'title': 'คำสั่งซื้อ', 'value': '320 รายการ'},
    {'title': 'รายได้', 'value': '85,000 บาท'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แดชบอร์ดสถิติ'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double w = constraints.maxWidth;
          int cols;
          String mode;
          if (w < 600) {
            cols = 1;
            mode = 'มือถือ';
          } else if (w <= 900) {
            cols = 2;
            mode = 'แท็บเล็ต';
          } else {
            cols = 4;
            mode = 'เดสก์ท็อป';
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'โหมด: $mode (${w.toInt()} px)',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    itemCount: stats.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: w < 600 ? 3.0 : 1.5,
                    ),
                    itemBuilder: (context, index) {
                      final item = stats[index];
                      return Card(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item['value']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}