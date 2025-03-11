import 'package:flutter/material.dart';

class MentalHealthPage extends StatelessWidget {
  const MentalHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kesehatan Mental'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildInfoCard(
            title: 'Layanan Konseling UPI',
            description: 'Layanan konseling untuk mahasiswa yang membutuhkan bantuan psikologis',
            contact: 'Telp: 022-1234567',
          ),
          _buildInfoCard(
            title: 'Hotline Kesehatan Mental',
            description: 'Layanan 24 jam untuk bantuan darurat psikologis',
            contact: 'Hotline: 119',
          ),
          _buildInfoCard(
            title: 'Tips Mengatasi Stress',
            description: 'Kumpulan tips untuk mengelola stress selama perkuliahan',
          ),
          _buildInfoCard(
            title: 'Jadwal Konsultasi',
            description: 'Jadwalkan konsultasi dengan psikolog kampus',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String description,
    String? contact,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
            if (contact != null) ...[
              const SizedBox(height: 8),
              Text(
                contact,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
            if (title != 'Tips Mengatasi Stress' && title != 'Jadwal Konsultasi') ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan navigasi atau aksi jika diperlukan
                },
                child: const Text('Lihat Detail'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
