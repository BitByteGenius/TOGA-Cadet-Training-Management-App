import 'package:toga/features/dashboard/data/models/dashboard_data.dart'; // ✅ FIXED

class DashboardService {
  Future<DashboardData> fetchDashboardDetails() async {
    await Future.delayed(const Duration(milliseconds: 1200));

    final mockJson = {
      "cadet_name": "Arjun Menon",
      "course": "PPL",
      "training_stage": "Navigation Phase",
      "assigned_fto": "AIRMAN Flight Academy",
      "assigned_instructor": "Capt. R. Sharma",
      "overall_study_progress": 64,
      "upcoming_flight": {
        "aircraft": "Cessna 172",
        "date": "2026-05-18",
        "time": "07:30 AM",
        "lesson": "Navigation Exercise"
      }
    };

    return DashboardData.fromJson(mockJson);
  }
}