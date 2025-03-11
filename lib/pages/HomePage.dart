import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                children: [
                  _buildScholarshipBanner(),
                  _buildTodaysClasses(),
                  _buildFeatureButtons(),
                ],
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Icon(Icons.menu, color: Colors.grey[600]),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari pengumuman, materi kuliah',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey[600]),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('lib/assets/images/beasiswa.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Beasiswa Sampurna',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Beasiswa untuk siswa berprestasi. Minimal mahasiswa semester 5. Tap untuk rincian.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodaysClasses() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kuliah hari ini ...',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Pemrograman Visual, 9.30 (C205); Data Mining 13.00 (C307)',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFeatureButton(icon: Icons.favorite_border, label: 'Mental Health', route: '/mental_health'),
          _buildFeatureButton(icon: Icons.folder, label: 'Akademik', route: '/akademik'),
          _buildFeatureButton(icon: Icons.cut, label: 'Keuangan', route: '/keuangan'),
        ],
      ),
    );
  }

  Widget _buildFeatureButton({required IconData icon, required String label, required String route}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.purple[200],
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(icon: Icons.face, label: 'Medsos', route: '/medsos'),
          _buildNavItem(icon: Icons.sunny, label: 'E-learning', route: '/elearning'),
          _buildNavItem(icon: Icons.calendar_today, label: 'Jadwal & Todo', route: '/jadwal_todo'),
          _buildNavItem(icon: Icons.message, label: 'Pesan', route: '/pesan_group'),
          _buildNavItem(icon: Icons.notifications, label: 'Notifikasi', route: '/notifikasi'),
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required String route}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
