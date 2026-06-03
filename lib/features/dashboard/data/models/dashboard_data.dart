import 'package:json_annotation/json_annotation.dart';
import 'package:toga/features/dashboard/data/models/upcoming_flight.dart';

part 'dashboard_data.g.dart';

@JsonSerializable()
class DashboardData {
  @JsonKey(name: 'cadet_name')
  final String cadetName;
  final String course;

  @JsonKey(name: 'training_stage')
  final String trainingStage;

  @JsonKey(name: 'assigned_fto')
  final String assignedFto;

  @JsonKey(name: 'assigned_instructor')
  final String assignedInstructor;

  @JsonKey(name: 'overall_study_progress')
  final int overallStudyProgress;

  @JsonKey(name: 'upcoming_flight')
  final UpcomingFlight upcomingFlight;

  DashboardData({
    required this.cadetName,
    required this.course,
    required this.trainingStage,
    required this.assignedFto,
    required this.assignedInstructor,
    required this.overallStudyProgress,
    required this.upcomingFlight,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);
}