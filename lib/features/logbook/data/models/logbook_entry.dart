import 'package:json_annotation/json_annotation.dart';

part 'logbook_entry.g.dart';

@JsonSerializable()
class LogbookEntry {
  final String date;
  final String aircraft;
  final String route;
  final double duration;
  final String lesson;

  LogbookEntry({
    required this.date,
    required this.aircraft,
    required this.route,
    required this.duration,
    required this.lesson,
  });

  factory LogbookEntry.fromJson(Map<String, dynamic> json) => _$LogbookEntryFromJson(json);
  Map<String, dynamic> toJson() => _$LogbookEntryToJson(this);
}