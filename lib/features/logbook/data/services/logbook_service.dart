
import 'package:toga/features/logbook/data/models/logbook_entry.dart';

class LogbookService {
  Future<List<LogbookEntry>> fetchLogbookEntries() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      LogbookEntry(
        date: "2026-05-10",
        aircraft: "C172",
        route: "VOMM - Training Area - VOMM",
        duration: 1.2,
        lesson: "Navigation",
      )
    ];
  }
}