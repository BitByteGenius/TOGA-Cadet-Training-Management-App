import 'package:json_annotation/json_annotation.dart';

part 'upcoming_flight.g.dart';

@JsonSerializable()
class UpcomingFlight {
  final String aircraft;
  final String date;
  final String time;
  final String lesson;

  UpcomingFlight({
    required this.aircraft,
    required this.date,
    required this.time,
    required this.lesson,
  });

  factory UpcomingFlight.fromJson(Map<String, dynamic> json) =>
      _$UpcomingFlightFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingFlightToJson(this);
}