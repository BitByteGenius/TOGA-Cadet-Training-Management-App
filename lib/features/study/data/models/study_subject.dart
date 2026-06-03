/*import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'study_subject.g.dart';

enum SubjectStatus {
  @JsonValue('Not Started') notStarted,
  @JsonValue('In Progress') inProgress,
  @JsonValue('Completed') completed,
}

@JsonSerializable()
class StudySubject {
  final String id;
  final String subjectName;
  final int progressPercentage;
  final int lessonsCompleted;
  final int totalLessons;
  final int quizScore;

  StudySubject({
    required this.id,
    required this.subjectName,
    required this.progressPercentage,
    required this.lessonsCompleted,
    required this.totalLessons,
    required this.quizScore,
  [span_6](start_span)}) : assert(progressPercentage >= 0 && progressPercentage <= 100, 'Progress must be between 0 and 100'),[span_6](end_span)
       [span_7](start_span)assert(quizScore >= 0 && quizScore <= 100, 'Quiz score must be between 0 and 100');[span_7](end_span)

  [span_8](start_span)/// Computes the correct status matching the system's strict functional guidelines[span_8](end_span)
  SubjectStatus get status {
    [span_9](start_span)if (progressPercentage == 0) return SubjectStatus.notStarted;[span_9](end_span)
    [span_10](start_span)if (progressPercentage == 100) return SubjectStatus.completed;[span_10](end_span)
    [span_11](start_span)return SubjectStatus.inProgress;[span_11](end_span)
  }

  [span_12](start_span)factory StudySubject.fromJson(Map<String, dynamic> json) => _$StudySubjectFromJson(json);[span_12](end_span)
  [span_13](start_span)Map<String, dynamic> toJson() => _$StudySubjectToJson(this);[span_13](end_span)
}*/

import 'package:json_annotation/json_annotation.dart';

part 'study_subject.g.dart';

enum SubjectStatus {
  @JsonValue('Not Started') notStarted,
  @JsonValue('In Progress') inProgress,
  @JsonValue('Completed') completed,
}

@JsonSerializable()
class StudySubject {
  final String id;
  final String subjectName;
  final int progressPercentage;
  final int lessonsCompleted;
  final int totalLessons;
  final int quizScore;

  StudySubject({
    required this.id,
    required this.subjectName,
    required this.progressPercentage,
    required this.lessonsCompleted,
    required this.totalLessons,
    required this.quizScore,
  })  : assert(progressPercentage >= 0 && progressPercentage <= 100,
            'Progress must be between 0 and 100'),
        assert(quizScore >= 0 && quizScore <= 100,
            'Quiz score must be between 0 and 100');

  /// Computes subject status
  SubjectStatus get status {
    if (progressPercentage == 0) return SubjectStatus.notStarted;
    if (progressPercentage == 100) return SubjectStatus.completed;
    return SubjectStatus.inProgress;
  }

  factory StudySubject.fromJson(Map<String, dynamic> json) =>
      _$StudySubjectFromJson(json);

  Map<String, dynamic> toJson() => _$StudySubjectToJson(this);
}