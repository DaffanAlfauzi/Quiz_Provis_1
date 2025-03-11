import 'package:flutter/material.dart';

// Model untuk Mata Kuliah
class Course {
  final String code;
  final String title;
  final String lecturer;

  Course({required this.code, required this.title, required this.lecturer});
}

final List<Course> courses = [
  Course(code: 'C205', title: 'Pemrograman Visual', lecturer: 'Dr. Budi Santoso'),
  Course(code: 'C307', title: 'Data Mining', lecturer: 'Prof. Ani Wijaya'),
  Course(code: 'C203', title: 'Basis Data Lanjut', lecturer: 'Dr. Dina Marliana'),
  Course(code: 'C301', title: 'Kecerdasan Buatan', lecturer: 'Dr. Eko Prasetyo'),
];

// Model untuk Data Akademik
class AcademicRecord {
  final String semester;
  final int sks;
  final double ipk;

  AcademicRecord({required this.semester, required this.sks, required this.ipk});
}

final List<AcademicRecord> academicRecords = [
  AcademicRecord(semester: 'Semester 1', sks: 20, ipk: 3.75),
  AcademicRecord(semester: 'Semester 2', sks: 22, ipk: 3.85),
  AcademicRecord(semester: 'Semester 3', sks: 21, ipk: 3.90),
  AcademicRecord(semester: 'Semester 4', sks: 19, ipk: 3.78),
];

// Widget utama ElearningPage
class ElearningPage extends StatelessWidget {
  const ElearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Learning'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Mata Kuliah',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseCard(course: courses[index]);
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Data Akademik',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: academicRecords.length,
            itemBuilder: (context, index) {
              return AcademicCard(record: academicRecords[index]);
            },
          ),
        ],
      ),
    );
  }
}

// Widget untuk menampilkan informasi mata kuliah
class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    course.code,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Dosen: ${course.lecturer}'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.book),
                    label: const Text('Materi'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.assignment),
                    label: const Text('Tugas'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menampilkan informasi akademik
class AcademicCard extends StatelessWidget {
  final AcademicRecord record;

  const AcademicCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              record.semester,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SKS: ${record.sks}'),
                Text(
                  'IPK: ${record.ipk}',
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