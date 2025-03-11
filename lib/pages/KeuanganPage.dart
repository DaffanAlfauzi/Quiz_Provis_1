import 'package:flutter/material.dart';

class KeuanganPage extends StatelessWidget {
  const KeuanganPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> paymentHistory = [
      {
        'semester': 'Semester 4',
        'amount': 5000000,
        'date': '15 Agustus 2024',
        'status': 'Lunas',
      },
      {
        'semester': 'Semester 3',
        'amount': 4800000,
        'date': '20 Februari 2024',
        'status': 'Lunas',
      },
      {
        'semester': 'Semester 2',
        'amount': 4800000,
        'date': '15 Agustus 2023',
        'status': 'Lunas',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Keuangan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CurrentBillCard(),
            const SizedBox(height: 16),
            const Text(
              'Riwayat Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: paymentHistory.length,
                itemBuilder: (context, index) {
                  return PaymentHistoryCard(payment: paymentHistory[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menampilkan tagihan semester berjalan
class CurrentBillCard extends StatelessWidget {
  const CurrentBillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tagihan Semester Berjalan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Rp 5.000.000',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 8),
            const Text('Jatuh Tempo: 15 Maret 2025'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {}, 
              child: const Text('Bayar Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menampilkan riwayat pembayaran
class PaymentHistoryCard extends StatelessWidget {
  final Map<String, dynamic> payment;
  const PaymentHistoryCard({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    Color statusColor = payment['status'] == 'Lunas' ? Colors.green : Colors.red;

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    payment['semester'] ?? 'Unknown Semester',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Rp ${payment['amount']?.toString() ?? '0'}'),
                  Text(
                    payment['date'] ?? 'Unknown Date',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                payment['status'] ?? 'Unknown Status',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
