import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/notification_provider.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('System Advisories'), backgroundColor: Colors.transparent),
      body: notifications.isEmpty
          ? const Center(child: Text('No dynamic alerts broadcasted.')) // Empty state requirement[span_13](start_span)[span_13](end_span)
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return Opacity(
                  opacity: item.isRead ? 0.6 : 1.0, // Visual read/unread feedback loop[span_14](start_span)[span_14](end_span)
                  child: Card(
                    color: const Color(0xFF131C2E),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: Icon(
                        item.type == 'Flight' ? Icons.airplanemode_active : Icons.chat_bubble_outline,
                        color: item.isRead ? Colors.grey : Colors.blueAccent,
                      ),
                      title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.message),
                          const SizedBox(height: 4),
                          Text(item.time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      trailing: !item.isRead
                          ? TextButton(
                              onPressed: () => ref.read(notificationProvider.notifier).markAsRead(item.id),
                              child: const Text('Mark Read'),
                            )
                          : const Icon(Icons.done_all, size: 16, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
    );
  }
}