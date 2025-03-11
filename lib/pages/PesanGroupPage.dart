import 'package:flutter/material.dart';

class PesanGroupPage extends StatelessWidget {
  const PesanGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pesan & Group'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pesan'),
              Tab(text: 'Group'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Pesan Tab
            ListView(
              children: const [
                ChatItem(
                  name: 'Dr. Budi Santoso',
                  lastMessage: 'Tolong kirimkan tugas Provis ke email saya',
                  time: '10:30',
                  unread: 2,
                ),
                ChatItem(
                  name: 'Farah Nurmala',
                  lastMessage: 'Sudah kau kerjakan tugas data mining?',
                  time: '09:15',
                  unread: 0,
                ),
                ChatItem(
                  name: 'Ahmad Rizki',
                  lastMessage: 'Besok kita ketemu jam berapa?',
                  time: 'Kemarin',
                  unread: 0,
                ),
                ChatItem(
                  name: 'TU Fakultas',
                  lastMessage: 'Pengumuman: Jadwal UTS sudah keluar',
                  time: 'Kemarin',
                  unread: 1,
                ),
              ],
            ),

            // Group Tab
            ListView(
              children: const [
                ChatItem(
                  name: 'Kelas Pemrograman Visual',
                  lastMessage: 'Rizki: Jadwal praktikum diganti jadi besok',
                  time: '11:45',
                  unread: 5,
                  isGroup: true,
                ),
                ChatItem(
                  name: 'Kelas Data Mining',
                  lastMessage: 'Dosen: Minggu depan kita review tugas',
                  time: '08:20',
                  unread: 0,
                  isGroup: true,
                ),
                ChatItem(
                  name: 'Kelompok Tubes',
                  lastMessage: 'Siti: Aku sudah buat mockup UI',
                  time: 'Kemarin',
                  unread: 12,
                  isGroup: true,
                ),
                ChatItem(
                  name: 'Himpunan Mahasiswa',
                  lastMessage: 'Ketua: Jangan lupa rapat besok',
                  time: '2 hari lalu',
                  unread: 0,
                  isGroup: true,
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Tambahkan aksi di sini (misalnya pindah ke halaman pesan baru)
          },
          child: const Icon(Icons.message),
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final int unread;
  final bool isGroup;

  const ChatItem({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unread,
    this.isGroup = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.indigo,
        child: Icon(
          isGroup ? Icons.group : Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          if (unread > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.indigo,
                shape: BoxShape.circle,
              ),
              child: Text(
                unread.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        // Tambahkan aksi ketika item ditekan
      },
    );
  }
}
