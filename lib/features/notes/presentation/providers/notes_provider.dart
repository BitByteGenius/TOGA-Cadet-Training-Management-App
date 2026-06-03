import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive/hive.dart';
import 'package:toga/features/notes/data/models/study_note.dart';

part 'notes_provider.g.dart';

@riverpod
class NotesNotifier extends _$NotesNotifier {
  late final Box<StudyNote> _box;

  @override
  List<StudyNote> build() {
    _box = Hive.box<StudyNote>('study_notes_box');
    return _box.values.toList();
  }

  Future<void> saveNoteLocal({
    required String subjectName,
    required String content,
  }) async {
    final newNote = StudyNote(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      subjectName: subjectName,
      content: content,
      createdAt: DateTime.now(),
      syncStatus: SyncStatus.pendingSync,
    );

    await _box.put(newNote.id, newNote);
    state = _box.values.toList();
  }

  Future<void> simulateSync(String noteId) async {
    final note = _box.get(noteId);
    if (note == null) return;

    await _box.put(
      noteId,
      note.copyWith(syncStatus: SyncStatus.syncing),
    );
    state = _box.values.toList();

    await Future.delayed(const Duration(seconds: 2));

    final isSuccess = Random().nextBool();

    if (isSuccess) {
      await _box.put(
        noteId,
        note.copyWith(syncStatus: SyncStatus.synced),
      );
    } else {
      await _box.put(
        noteId,
        note.copyWith(syncStatus: SyncStatus.failed),
      );
    }

    state = _box.values.toList();
  }
}
