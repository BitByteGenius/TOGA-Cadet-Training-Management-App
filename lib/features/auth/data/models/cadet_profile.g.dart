// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadet_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadetProfile _$CadetProfileFromJson(Map<String, dynamic> json) => CadetProfile(
  name: json['name'] as String,
  role: json['role'] as String,
  course: json['course'] as String,
  fto: json['fto'] as String,
  instructor: json['instructor'] as String,
  base: json['base'] as String,
);

Map<String, dynamic> _$CadetProfileToJson(CadetProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'course': instance.course,
      'fto': instance.fto,
      'instructor': instance.instructor,
      'base': instance.base,
    };
