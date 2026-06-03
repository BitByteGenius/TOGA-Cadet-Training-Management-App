import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toga/features/dashboard/data/models/dashboard_data.dart';
import 'package:toga/features/dashboard/data/services/dashboard_services.dart';

part 'dashboard_provider.g.dart';

@riverpod
DashboardService dashboardService(Ref ref) {
  return DashboardService();
}

@riverpod
class DashboardDataNotifier extends _$DashboardDataNotifier {
  @override
  Future<DashboardData> build() async {
    final service = ref.watch(dashboardServiceProvider);
    return service.fetchDashboardDetails();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(dashboardServiceProvider);
      return service.fetchDashboardDetails();
    });
  }
}