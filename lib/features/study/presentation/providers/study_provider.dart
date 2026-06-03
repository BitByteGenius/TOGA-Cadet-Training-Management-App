import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toga/features/study/data/models/chapter.dart';
import 'package:toga/features/study/data/models/study_subject.dart';
import '../../data/services/study_service.dart';

part 'study_provider.g.dart';

@riverpod
StudyService studyService(Ref ref) => StudyService();

@riverpod
class SubjectsListNotifier extends _$SubjectsListNotifier {
  @override
  Future<List<StudySubject>> build() async {
    return ref.watch(studyServiceProvider).fetchSubjects();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(studyServiceProvider).fetchSubjects();
    });
  }
}

@riverpod
class ChaptersListNotifier extends _$ChaptersListNotifier {
  @override
  Future<List<Chapter>> build(String subjectId) async {
    return ref.watch(studyServiceProvider).fetchChaptersForSubject(subjectId);
  }

  Future<void> refresh(String subjectId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(studyServiceProvider).fetchChaptersForSubject(subjectId);
    });
  }
}
