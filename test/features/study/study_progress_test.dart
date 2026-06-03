import 'package:flutter_test/flutter_test.dart';
import 'package:toga/features/study/data/models/study_subject.dart';

void main() {
  group('TOGA Functional Validation Tests', () {
    
    test('Rule 4: Verify status calculations compute correctly from percentages', () {
      final notStartedSubject = StudySubject(
        id: "1", subjectName: "Nav", progressPercentage: 0, lessonsCompleted: 0, totalLessons: 10, quizScore: 0
      );
      final inProgressSubject = StudySubject(
        id: "2", subjectName: "Met", progressPercentage: 45, lessonsCompleted: 9, totalLessons: 20, quizScore: 80
      );
      final completedSubject = StudySubject(
        id: "3", subjectName: "Regs", progressPercentage: 100, lessonsCompleted: 10, totalLessons: 10, quizScore: 90
      );

      expect(notStartedSubject.status, SubjectStatus.notStarted);
      expect(inProgressSubject.status, SubjectStatus.inProgress);
      expect(completedSubject.status, SubjectStatus.completed);
    });

    test('Rule 2 & 3: Assertions throw when parameter boundaries exceed 100%', () {
      expect(() => StudySubject(
        id: "4", subjectName: "Invalid", progressPercentage: 150, lessonsCompleted: 10, totalLessons: 10, quizScore: 80
      ), throwsA(isA<AssertionError>()));
    });
  });
}
