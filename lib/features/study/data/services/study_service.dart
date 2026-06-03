
import 'package:toga/features/study/data/models/study_subject.dart';
import 'package:toga/features/study/data/models/chapter.dart';

class StudyService {
  Future<List<StudySubject>> fetchSubjects() async {
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Exact data structures requested by the Airman technical context
    final mockJson = [
      {
        "id": "met",
        "subjectName": "Meteorology",
        "progressPercentage": 72,
        "lessonsCompleted": 18,
        "totalLessons": 25,
        "quizScore": 81
      },
      {
        "id": "air-reg",
        "subjectName": "Air Regulations",
        "progressPercentage": 100,
        "lessonsCompleted": 30,
        "totalLessons": 30,
        "quizScore": 92
      },
      {
        "id": "nav",
        "subjectName": "Navigation",
        "progressPercentage": 0,
        "lessonsCompleted": 0,
        "totalLessons": 20,
        "quizScore": 0
      }
    ];

    return mockJson.map((json) => StudySubject.fromJson(json)).toList();
  }

  Future<List<Chapter>> fetchChaptersForSubject(String subjectId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Chapter(id: "c1", chapterName: "Atmosphere", isCompleted: true),
      Chapter(id: "c2", chapterName: "Pressure Systems", isCompleted: true),
      Chapter(id: "c3", chapterName: "Clouds and Precipitation", isCompleted: false),
      Chapter(id: "c4", chapterName: "Thunderstorms", isCompleted: false),
    ];
  }
}