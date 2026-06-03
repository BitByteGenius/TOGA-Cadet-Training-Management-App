import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toga/features/notes/data/models/study_note.dart';
import 'package:toga/features/notes/presentation/providers/notes_provider.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  final _noteController = TextEditingController();
  String _selectedSubject = 'Meteorology';
  final List<String> _subjects = ['Meteorology', 'Air Regulations', 'Navigation', 'Technical General'];

  void _submitNote() {
    if (_noteController.text.trim().isEmpty) return;
    
    ref.read(notesProvider.notifier).saveNoteLocal(
          subjectName: _selectedSubject,
          content: _noteController.text,
        );
    
    _noteController.clear(); // Safe execution: clears form input field after safe local cache commits
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Offline Study Engine'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Note creation form inputs
            DropdownButtonFormField<String>(
              initialValue: _selectedSubject,
              items: _subjects.map((sub) => DropdownMenuItem(value: sub, child: Text(sub))).toList(),
              onChanged: (val) => setState(() => _selectedSubject = val!),
              decoration: const InputDecoration(labelText: 'Aviation Subject', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Enter technical aircraft observation or note...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save'), // Requirement 5: Must save before sync
              onPressed: _submitNote,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
            ),
            const Divider(height: 32),
            
            // List displaying local saved entries
            Expanded(
              child: notes.isEmpty
                  ? const Center(child: Text('No notes stored locally on device.'))
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return Card(
                          color: const Color(0xFF131C2E),
                          child: ListTile(
                            title: Text(note.subjectName, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(note.content),
                                const SizedBox(height: 8),
                                _buildSyncBadge(note.syncStatus),
                              ],
                            ),
                            trailing: note.syncStatus == SyncStatus.syncing
                                ? const CircularProgressIndicator()
                                : IconButton(
                                    icon: const Icon(Icons.sync, color: Colors.blueAccent),
                                    onPressed: () => ref.read(notesProvider.notifier).simulateSync(note.id),
                                  ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSyncBadge(SyncStatus status) {
    Color badgeColor;
    String label;

    switch (status) {
      case SyncStatus.pendingSync:
        badgeColor = Colors.orange;
        label = 'Pending Sync';
        break;
      case SyncStatus.syncing:
        badgeColor = Colors.blue;
        label = 'Syncing...';
        break;
      case SyncStatus.synced:
        badgeColor = Colors.green;
        label = 'Synced Successfully';
        break;
      case SyncStatus.failed:
        badgeColor = Colors.red;
        label = 'Sync Failed - Retry';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: badgeColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(4)),
      child: Text(label, style: TextStyle(color: badgeColor, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}