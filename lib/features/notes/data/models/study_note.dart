import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'study_note.g.dart';

@JsonEnum(valueField: 'label')
@HiveType(typeId: 1)
enum SyncStatus {
  @HiveField(0)
  pendingSync('pending'),
  
  @HiveField(1)
  syncing('syncing'),
  
  @HiveField(2)
  synced('synced'),
  
  @HiveField(3)
  failed('failed');

  final String label;
  const SyncStatus(this.label);
}

@JsonSerializable()
@HiveType(typeId: 0)
class StudyNote extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String subjectName;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final DateTime createdAt;

  @HiveField(4)
  @JsonKey(unknownEnumValue: SyncStatus.pendingSync)
  final SyncStatus syncStatus;

  StudyNote({
    required this.id,
    required this.subjectName,
    required this.content,
    required this.createdAt,
    this.syncStatus = SyncStatus.pendingSync,
  });

  /// Deep copy utility method to safely alter state variables immutably
  StudyNote copyWith({
    String? id,
    String? subjectName,
    String? content,
    DateTime? createdAt,
    SyncStatus? syncStatus,
  }) {
    return StudyNote(
      id: id ?? this.id,
      subjectName: subjectName ?? this.subjectName,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  factory StudyNote.fromJson(Map<String, dynamic> json) => _$StudyNoteFromJson(json);
  Map<String, dynamic> toJson() => _$StudyNoteToJson(this);
}

class StudyNoteAdapter extends TypeAdapter<StudyNote> {
  @override
  final int typeId = 0;

  @override
  StudyNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudyNote(
      id: fields[0] as String,
      subjectName: fields[1] as String,
      content: fields[2] as String,
      createdAt: fields[3] as DateTime,
      syncStatus: fields[4] as SyncStatus,
    );
  }

  @override
  void write(BinaryWriter writer, StudyNote obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.subjectName)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.syncStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudyNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SyncStatusAdapter extends TypeAdapter<SyncStatus> {
  @override
  final int typeId = 1;

  @override
  SyncStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SyncStatus.pendingSync;
      case 1:
        return SyncStatus.syncing;
      case 2:
        return SyncStatus.synced;
      case 3:
        return SyncStatus.failed;
      default:
        return SyncStatus.pendingSync;
    }
  }

  @override
  void write(BinaryWriter writer, SyncStatus obj) {
    switch (obj) {
      case SyncStatus.pendingSync:
        writer.writeByte(0);
        break;
      case SyncStatus.syncing:
        writer.writeByte(1);
        break;
      case SyncStatus.synced:
        writer.writeByte(2);
        break;
      case SyncStatus.failed:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}