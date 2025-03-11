import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  final List<NotificationItem> notifications = const [
    NotificationItem(
      title: 'Pengumuman Beasiswa',
      message: 'Pendaftaran beasiswa sampurna sudah dibuka',
      time: '20 menit yang lalu',
      type: NotificationType.announcement,
    ),
    NotificationItem(
      title: 'Deadline Tugas',
      message: 'Tubes 1 Provis harus dikumpulkan besok pukul 19.00',
      time: '1 jam yang lalu',
      type: NotificationType.task,
    ),
    NotificationItem(
      title: 'Pesan Baru',
      message: 'Dr. Budi Santoso mengirim pesan baru',
      time: '3 jam yang lalu',
      type: NotificationType.message,
    ),
    NotificationItem(
      title: 'Perubahan Jadwal',
      message: 'Kelas Data Mining besok pindah ke ruang C309',
      time: '5 jam yang lalu',
      type: NotificationType.schedule,
    ),
    NotificationItem(
      title: 'Pembayaran',
      message: 'Pengingat: Tagihan semester berjalan belum dibayar',
      time: '1 hari yang lalu',
      type: NotificationType.payment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCard(notification: notification);
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final iconData = _getIcon(notification.type);
    final color = _getColor(notification.type);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(iconData, color: color),
      ),
      title: Text(
        notification.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notification.message),
          const SizedBox(height: 4),
          Text(
            notification.time,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
      isThreeLine: true,
      onTap: () {
        // Tambahkan aksi jika diperlukan
      },
    );
  }

  IconData _getIcon(NotificationType type) {
    switch (type) {
      case NotificationType.announcement:
        return Icons.campaign;
      case NotificationType.task:
        return Icons.assignment;
      case NotificationType.message:
        return Icons.message;
      case NotificationType.schedule:
        return Icons.event;
      case NotificationType.payment:
        return Icons.payment;
    }
  }

  Color _getColor(NotificationType type) {
    switch (type) {
      case NotificationType.announcement:
        return Colors.blue;
      case NotificationType.task:
        return Colors.orange;
      case NotificationType.message:
        return Colors.green;
      case NotificationType.schedule:
        return Colors.purple;
      case NotificationType.payment:
        return Colors.red;
    }
  }
}

// Model untuk Notifikasi
class NotificationItem {
  final String title;
  final String message;
  final String time;
  final NotificationType type;

  const NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
  });
}

// Enum jenis notifikasi
enum NotificationType {
  announcement,
  task,
  message,
  schedule,
  payment,
}
