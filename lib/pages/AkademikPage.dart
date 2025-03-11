import 'package:flutter/material.dart';

class AkademikPage extends StatelessWidget {
  const AkademikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akademik'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAcademicCard(
            semester: 'Semester 1',
            sks: 20,
            ipk: 3.75,
          ),
          _buildAcademicCard(
            semester: 'Semester 2',
            sks: 22,
            ipk: 3.85,
          ),
          _buildAcademicCard(
            semester: 'Semester 3',
            sks: 21,
            ipk: 3.90,
          ),
          _buildAcademicCard(
            semester: 'Semester 4',
            sks: 19,
            ipk: 3.78,
          ),
          Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'IPK Kumulatif',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '3.82',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Total SKS: 82',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildAcademicCard({
    required String semester,
    required int sks,
    required double ipk,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              semester,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SKS: $sks'),
                Text(
                  'IPK: $ipk',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Lihat Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
