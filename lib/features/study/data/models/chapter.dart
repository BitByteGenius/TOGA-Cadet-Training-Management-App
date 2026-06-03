import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  final String id;
  final String chapterName;
  final bool isCompleted;

  Chapter({
    required this.id,
    required this.chapterName,
    required this.isCompleted,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}