// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    DashboardData(
      cadetName: json['cadet_name'] as String,
      course: json['course'] as String,
      trainingStage: json['training_stage'] as String,
      assignedFto: json['assigned_fto'] as String,
      assignedInstructor: json['assigned_instructor'] as String,
      overallStudyProgress: (json['overall_study_progress'] as num).toInt(),
      upcomingFlight: UpcomingFlight.fromJson(
        json['upcoming_flight'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DashboardDataToJson(DashboardData instance) =>
    <String, dynamic>{
      'cadet_name': instance.cadetName,
      'course': instance.course,
      'training_stage': instance.trainingStage,
      'assigned_fto': instance.assignedFto,
      'assigned_instructor': instance.assignedInstructor,
      'overall_study_progress': instance.overallStudyProgress,
      'upcoming_flight': instance.upcomingFlight,
    };
