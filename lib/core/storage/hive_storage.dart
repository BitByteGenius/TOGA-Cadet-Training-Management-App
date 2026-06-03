import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toga/features/notes/data/models/study_note.dart';

part 'hive_storage.g.dart';

class HiveStorageService {
  static const String _notesBoxName = 'study_notes_box';

  Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(StudyNoteAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(SyncStatusAdapter());
    }

    await Hive.openBox<StudyNote>(_notesBoxName);
  }

  Box<StudyNote> get notesBox => Hive.box<StudyNote>(_notesBoxName);

  Future<void> clearAllBoxes() async {
    if (Hive.isBoxOpen(_notesBoxName)) {
      await notesBox.clear();
    }
  }
}

@riverpod
HiveStorageService storageService(Ref ref) {
  return HiveStorageService();
}