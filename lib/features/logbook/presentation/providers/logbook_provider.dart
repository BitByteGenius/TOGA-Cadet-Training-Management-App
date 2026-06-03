import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toga/features/logbook/data/models/logbook_entry.dart';
import 'package:toga/features/logbook/data/services/logbook_service.dart';

part 'logbook_provider.g.dart';

@riverpod
LogbookService logbookService(Ref ref) {
  return LogbookService();
}

@riverpod
class LogbookEntriesNotifier extends _$LogbookEntriesNotifier {
  @override
  Future<List<LogbookEntry>> build() async {
    final service = ref.watch(logbookServiceProvider);
    return service.fetchLogbookEntries();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(logbookServiceProvider);
      return service.fetchLogbookEntries();
    });
  }
}
