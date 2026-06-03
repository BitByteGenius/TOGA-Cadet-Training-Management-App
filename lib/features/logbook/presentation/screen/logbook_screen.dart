import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toga/core/widget/error_view.dart';
import '../providers/logbook_provider.dart';

class LogbookScreen extends ConsumerWidget {
  const LogbookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logbookAsync = ref.watch(logbookEntriesProvider );

    return Scaffold(
      appBar: AppBar(title: const Text('Pilot Logbook'), backgroundColor: Colors.transparent),
      body: logbookAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => ErrorView(
          message: 'Failed to load flight logs: $err',
          onRetry: () => ref.read(logbookEntriesProvider .notifier).refresh(),
        ),
        data: (entries) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Metrics Overview Panel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMetricCard('Total Hours', '42.5 hrs'),
                  _buildMetricCard('Solo Hours', '6.2 hrs'),
                  _buildMetricCard('Dual Hours', '36.3 hrs'),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Recent Flight Logs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              
              Expanded(
                child: entries.isEmpty
                    ? const Center(child: Text('No flight records logged.'))
                    : ListView.builder(
                        itemCount: entries.length,
                        itemBuilder: (context, index) {
                          final entry = entries[index];
                          return Card(
                            color: const Color(0xFF131C2E),
                            child: ListTile(
                              leading: const Icon(Icons.flight, color: Colors.blueAccent),
                              title: Text('${entry.lesson} (${entry.aircraft})'),
                              subtitle: Text(entry.route),
                              trailing: Text('${entry.duration} hrs', style: const TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: const Color(0xFF131C2E), borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}