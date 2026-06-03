// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudySubject _$StudySubjectFromJson(Map<String, dynamic> json) => StudySubject(
  id: json['id'] as String,
  subjectName: json['subjectName'] as String,
  progressPercentage: (json['progressPercentage'] as num).toInt(),
  lessonsCompleted: (json['lessonsCompleted'] as num).toInt(),
  totalLessons: (json['totalLessons'] as num).toInt(),
  quizScore: (json['quizScore'] as num).toInt(),
);

Map<String, dynamic> _$StudySubjectToJson(StudySubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectName': instance.subjectName,
      'progressPercentage': instance.progressPercentage,
      'lessonsCompleted': instance.lessonsCompleted,
      'totalLessons': instance.totalLessons,
      'quizScore': instance.quizScore,
    };
