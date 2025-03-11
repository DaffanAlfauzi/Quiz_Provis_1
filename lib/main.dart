import 'package:flutter/material.dart';

// Import semua halaman yang ada di lib/pages/
import 'package:quiz_provis/pages/HomePage.dart';
import 'package:quiz_provis/pages/MentalHealthPage.dart';
import 'package:quiz_provis/pages/AkademikPage.dart';
import 'package:quiz_provis/pages/KeuanganPage.dart';
import 'package:quiz_provis/pages/MedsosPage.dart';
import 'package:quiz_provis/pages/ElearningPage.dart';
import 'package:quiz_provis/pages/JadwalTodoPage.dart';
import 'package:quiz_provis/pages/PesanGroupPage.dart';
import 'package:quiz_provis/pages/NotifikasiPage.dart';

void main() {
  runApp(const UPIApp());
}

class UPIApp extends StatelessWidget {
  const UPIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPI Super App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomePage(),
      routes: {
        '/mental_health': (context) => const MentalHealthPage(),
        '/akademik': (context) => const AkademikPage(),
        '/keuangan': (context) => const KeuanganPage(),
        '/medsos': (context) => const MedsosPage(),
        '/elearning': (context) => const ElearningPage(),
        '/jadwal_todo': (context) => const JadwalTodoPage(),
        '/pesan_group': (context) => const PesanGroupPage(),
        '/notifikasi': (context) => const NotifikasiPage(),
      },
    );
  }
}