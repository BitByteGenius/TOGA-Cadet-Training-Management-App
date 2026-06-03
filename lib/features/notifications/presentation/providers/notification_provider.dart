import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toga/features/notifications/data/models/notification_item.dart';

part 'notification_provider.g.dart';
@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  @override
  List<NotificationItem> build() {
    // Sourced from assessment product requirements[span_7](start_span)[span_7](end_span)
    return [
      NotificationItem(
        id: "1",
        title: "Upcoming Flight Reminder",
        message: "Your Navigation Exercise in Cessna 172 is scheduled for 2026-05-18.",
        type: "Flight",
        time: "07:30 AM",
        isRead: false,
      ),
      NotificationItem(
        id: "2",
        title: "Instructor Feedback Update",
        message: "Capt. R. Sharma left feedback on your last landing sequence.",
        type: "Instructor",
        time: "Yesterday",
        isRead: false,
      )
    ];
  }

  void markAsRead(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(isRead: true) else item
    ]; // Rule 8: Persists read state securely inside memory across navigation[span_8](start_span)[span_8](end_span)
  }
}