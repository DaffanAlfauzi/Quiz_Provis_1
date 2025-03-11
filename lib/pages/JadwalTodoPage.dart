import 'package:flutter/material.dart';

class JadwalTodoPage extends StatelessWidget {
  const JadwalTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jadwal & Todo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Jadwal'),
              Tab(text: 'Todo'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Jadwal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  _buildScheduleItem('Senin', [
                    'Pemrograman Visual (09:30 - 12:00) - C205',
                    'Kecerdasan Buatan (13:00 - 15:30) - C301',
                  ]),
                  _buildScheduleItem('Selasa', [
                    'Data Mining (13:00 - 15:30) - C307',
                  ]),
                  _buildScheduleItem('Rabu', [
                    'Basis Data Lanjut (09:30 - 12:00) - C203',
                  ]),
                  _buildScheduleItem('Kamis', [
                    'Provis (09:30 - 12:00) - Lab 3',
                  ]),
                  _buildScheduleItem('Jumat', [
                    'Data Mining (13:00 - 15:30) - Lab 2',
                  ]),
                ],
              ),
            ),

            // Tab Todo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  _buildTodoItem('Tubes 1 Provis', 'Besok, 19:00', 'Tinggi'),
                  _buildTodoItem('Tugas Data Mining', '20 Maret 2025, 23:59', 'Sedang'),
                  _buildTodoItem('Quiz Basis Data', '22 Maret 2025, 10:00', 'Sedang'),
                  _buildTodoItem('Presentasi Kecerdasan Buatan', '25 Maret 2025, 09:30', 'Tinggi'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Tambah Jadwal/Todo',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  /// Widget untuk item Jadwal
  Widget _buildScheduleItem(String day, List<String> courses) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: courses.map((course) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(course),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk item Todo
  Widget _buildTodoItem(String title, String deadline, String priority) {
    Color priorityColor = _getPriorityColor(priority);

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
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('Deadline: $deadline', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: priorityColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                priority,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Fungsi untuk mendapatkan warna prioritas
  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Tinggi':
        return Colors.red;
      case 'Sedang':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }
}
