import 'package:flutter/material.dart';

class MedsosPage extends StatelessWidget {
  const MedsosPage({super.key});

  final List<Map<String, dynamic>> posts = const [
    {
      'name': 'Ahmad Rizki',
      'time': '20 menit yang lalu',
      'content': 'Hari ini kelas Algoritma dibatalkan. Dosen sedang ada urusan mendadak.',
      'likes': 15,
      'comments': 3,
    },
    {
      'name': 'Siti Nurhaliza',
      'time': '1 jam yang lalu',
      'content': 'Ada yang punya catatan Basis Data minggu lalu? Saya izin tidak masuk kelas.',
      'likes': 8,
      'comments': 10,
    },
    {
      'name': 'Program Studi Ilmu Komputer',
      'time': '3 jam yang lalu',
      'content': 'Pengumuman: Seminar tugas akhir akan diadakan pada tanggal 20 Maret 2025. Bagi mahasiswa yang ingin mendaftar harap segera menghubungi sekretariat.',
      'likes': 42,
      'comments': 7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Sosial UPI'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostItem(
            name: post['name'],
            time: post['time'],
            content: post['content'],
            likes: post['likes'],
            comments: post['comments'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String name;
  final String time;
  final String content;
  final int likes;
  final int comments;

  const PostItem({
    required this.name,
    required this.time,
    required this.content,
    required this.likes,
    required this.comments,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.indigo,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(content),
            const SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.thumb_up, size: 16),
                ),
                const SizedBox(width: 4),
                Text('$likes'),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.comment, size: 16),
                ),
                const SizedBox(width: 4),
                Text('$comments'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
