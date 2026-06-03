import 'package:json_annotation/json_annotation.dart';

part 'cadet_profile.g.dart';

@JsonSerializable()
class CadetProfile {
  final String name;
  final String role;
  final String course;
  final String fto;
  final String instructor;
  final String base;

  CadetProfile({
    required this.name,
    required this.role,
    required this.course,
    required this.fto,
    required this.instructor,
    required this.base,
  });

  factory CadetProfile.fromJson(Map<String, dynamic> json) => _$CadetProfileFromJson(json);
  Map<String, dynamic> toJson() => _$CadetProfileToJson(this);
}