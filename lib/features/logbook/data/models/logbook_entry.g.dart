// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logbook_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogbookEntry _$LogbookEntryFromJson(Map<String, dynamic> json) => LogbookEntry(
  date: json['date'] as String,
  aircraft: json['aircraft'] as String,
  route: json['route'] as String,
  duration: (json['duration'] as num).toDouble(),
  lesson: json['lesson'] as String,
);

Map<String, dynamic> _$LogbookEntryToJson(LogbookEntry instance) =>
    <String, dynamic>{
      'date': instance.date,
      'aircraft': instance.aircraft,
      'route': instance.route,
      'duration': instance.duration,
      'lesson': instance.lesson,
    };
