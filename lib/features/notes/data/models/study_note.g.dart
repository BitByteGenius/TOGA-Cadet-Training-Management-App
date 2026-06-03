// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyNote _$StudyNoteFromJson(Map<String, dynamic> json) => StudyNote(
  id: json['id'] as String,
  subjectName: json['subjectName'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  syncStatus:
      $enumDecodeNullable(
        _$SyncStatusEnumMap,
        json['syncStatus'],
        unknownValue: SyncStatus.pendingSync,
      ) ??
      SyncStatus.pendingSync,
);

Map<String, dynamic> _$StudyNoteToJson(StudyNote instance) => <String, dynamic>{
  'id': instance.id,
  'subjectName': instance.subjectName,
  'content': instance.content,
  'createdAt': instance.createdAt.toIso8601String(),
  'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
};

const _$SyncStatusEnumMap = {
  SyncStatus.pendingSync: 'pending',
  SyncStatus.syncing: 'syncing',
  SyncStatus.synced: 'synced',
  SyncStatus.failed: 'failed',
};
