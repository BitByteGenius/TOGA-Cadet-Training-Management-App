import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toga/core/widget/error_view.dart';
import 'package:toga/features/study/presentation/providers/study_provider.dart';
import '../../data/models/study_subject.dart';

class SubjectDetailScreen extends ConsumerWidget {
  final StudySubject subject;
  const SubjectDetailScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chaptersAsync = ref.watch(chaptersListProvider (subject.id));

    return Scaffold(
      appBar: AppBar(title: Text(subject.subjectName), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          // Modular Interaction Tool Dock
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionChip(context, Icons.quiz, 'Quiz'),
                _buildActionChip(context, Icons.style, 'Flashcards'),
                _buildActionChip(context, Icons.assignment, 'Mock Exam'),
              ],
            ),
          ),
          
          // AIRMAN AI Assistant Placeholder
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.blueAccent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const Icon(Icons.psychology, color: Colors.blueAccent),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'AIRMAN AI will help you clarify aviation concepts here.', // Verbatim instruction phrase
                    style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: chaptersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => ErrorView(
                message: 'Failed to load chapters: $err',
                onRetry: () => ref.read(chaptersListProvider    (subject.id).notifier).refresh(subject.id),
              ),
              data: (chapters) => ListView.builder(
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  return ListTile(
                    leading: Icon(
                      chapter.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: chapter.isCompleted ? Colors.green : Colors.grey,
                    ),
                    title: Text(chapter.chapterName),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActionChip(BuildContext context, IconData icon, String label) {
    return ActionChip(
      avatar: Icon(icon, size: 16, color: Colors.blueAccent),
      label: Text(label),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Opening $label engine...')), // Quick interface responsive snackbar rule
        );
      },
    );
  }
}