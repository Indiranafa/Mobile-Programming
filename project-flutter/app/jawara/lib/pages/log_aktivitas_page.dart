import 'package:flutter/material.dart';

class LogAktivitasPage extends StatelessWidget {
  const LogAktivitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logs = List.generate(
      20,
      (i) => {
        'id': 'l$i',
        'title': i % 2 == 0 ? 'Login berhasil' : 'Data diperbarui',
        'detail': 'Detail aktivitas nomor $i',
        'time': DateTime.now().subtract(Duration(minutes: i * 5)),
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Log Aktivitas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Cari log...'),
              onChanged: (v) {
                // For now, client-side filtering could be added.
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final l = logs[index];
                return ListTile(
                  title: Text(l['title'] as String),
                  subtitle: Text(l['detail'] as String),
                  trailing: Text(_timeAgo(l['time'] as DateTime)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(l['title'] as String),
                        content: Text('${l['detail']}\n\nWaktu: ${l['time']}'),
                        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup'))],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _timeAgo(DateTime t) {
    final diff = DateTime.now().difference(t);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return '${diff.inDays}d';
  }
}
