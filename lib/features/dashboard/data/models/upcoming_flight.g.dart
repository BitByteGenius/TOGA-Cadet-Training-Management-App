// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingFlight _$UpcomingFlightFromJson(Map<String, dynamic> json) =>
    UpcomingFlight(
      aircraft: json['aircraft'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      lesson: json['lesson'] as String,
    );

Map<String, dynamic> _$UpcomingFlightToJson(UpcomingFlight instance) =>
    <String, dynamic>{
      'aircraft': instance.aircraft,
      'date': instance.date,
      'time': instance.time,
      'lesson': instance.lesson,
    };
