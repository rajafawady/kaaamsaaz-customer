import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16423C),
        foregroundColor: Colors.white,
        title: const Text('Chats'),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFDCE7E1),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          itemCount: 10, // Replace with dynamic count for real data
          separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          itemBuilder: (context, index) {
            return ChatListItem(
              avatarUrl: 'https://via.placeholder.com/150', // Placeholder image
              name: 'User $index',
              lastMessage: 'This is the last message from User $index.',
              time: '12:3${index % 10} PM',
              isUnread: index % 2 == 0, // Example logic for unread messages
            );
          },
        ),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String lastMessage;
  final String time;
  final bool isUnread;

  const ChatListItem({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.isUnread,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF16423C),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[500],
                ),
              ),
              if (isUnread)
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF16423C),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
