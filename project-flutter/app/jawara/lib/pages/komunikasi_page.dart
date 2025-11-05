import 'package:flutter/material.dart';
import '../models/message.dart';

class KomunikasiPage extends StatelessWidget {
  const KomunikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final conversations = [
      {
        'id': 'c1',
        'title': 'Tim Proyek',
        'lastMessage': 'Siap, saya kerjakan nanti sore',
        'time': DateTime.now().subtract(const Duration(minutes: 15)),
      },
      {
        'id': 'c2',
        'title': 'Pembimbing',
        'lastMessage': 'Perbaiki bagian UI',
        'time': DateTime.now().subtract(const Duration(hours: 2)),
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Komunikasi')),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final c = conversations[index];
          return ListTile(
            title: Text(c['title'] as String),
            subtitle: Text(c['lastMessage'] as String),
            trailing: Text(
              _timeAgo(c['time'] as DateTime),
              style: const TextStyle(fontSize: 12),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(conversationId: c['id'] as String, title: c['title'] as String),
                ),
              );
            },
          );
        },
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

class ChatScreen extends StatefulWidget {
  final String conversationId;
  final String title;

  const ChatScreen({super.key, required this.conversationId, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final List<Message> _messages = [
    Message(id: 'm1', senderId: 'u1', text: 'Halo tim!', timestamp: DateTime.now().subtract(const Duration(minutes: 30))),
    Message(id: 'm2', senderId: 'u2', text: 'Halo, ada update?', timestamp: DateTime.now().subtract(const Duration(minutes: 25))),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(Message(id: DateTime.now().millisecondsSinceEpoch.toString(), senderId: 'me', text: text, timestamp: DateTime.now()));
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[_messages.length - 1 - index];
                final isMe = msg.senderId == 'me';
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(msg.text, style: TextStyle(color: isMe ? Colors.white : Colors.black)),
                        const SizedBox(height: 4),
                        Text(
                          _formatTime(msg.timestamp),
                          style: TextStyle(fontSize: 10, color: isMe ? Colors.white70 : Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(hintText: 'Tulis pesan...'),
                      onSubmitted: (_) => _send(),
                    ),
                  ),
                ),
                IconButton(onPressed: _send, icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }

  String _formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
