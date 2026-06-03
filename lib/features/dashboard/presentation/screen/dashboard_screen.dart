import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toga/core/widget/error_view.dart';
import 'package:toga/features/notifications/presentation/providers/notification_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/dashboard_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardDataProvider);
      final notifications = ref.watch(notificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TOGA Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () =>
                ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: dashboardAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Colors.blueAccent),
        ),
        error: (err, stack) => ErrorView(
          message: 'Failed to load dashboard: $err',
          onRetry: () =>
              ref.read(dashboardDataProvider.notifier).refresh(),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () =>
              ref.read(dashboardDataProvider.notifier).refresh(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isTablet = constraints.maxWidth > 650;

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Text(
                      'Welcome back, ${data.cadetName}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Stage: ${data.trainingStage} (${data.course})',
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 24),

                    // ===== MAIN CARDS =====
                    if (isTablet)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _leftSection(data, context)),
                          const SizedBox(width: 16),
                          Expanded(child: _flightCard(data)),
                        ],
                      )
                    else ...[
                      _leftSection(data, context),
                      const SizedBox(height: 16),
                      _flightCard(data),
                    ],

                     // ✅ ===== NOTIFICATION PREVIEW (ADDED) =====
                    const SizedBox(height: 16),
                    _buildNotificationPreview(context, notifications),

                    // ===== NEW NAVIGATION CARDS =====
                    const SizedBox(height: 24),
                    const Text(
                      "Quick Access",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    GridView.count(
                      crossAxisCount: isTablet ? 4 : 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 2.5,
                      children: [
                        _buildNavCard(
                          title: "Study",
                          icon: Icons.menu_book,
                          color: Colors.blueAccent,
                          onTap: () => context.push('/subjects'),
                        ),
                        _buildNavCard(
                          title: "Notes",
                          icon: Icons.note_alt,
                          color: Colors.purpleAccent,
                          onTap: () => context.push('/notes'),
                        ),
                        _buildNavCard(
                          title: "Logbook",
                          icon: Icons.book,
                          color: Colors.orangeAccent,
                          onTap: () => context.push('/logbook'),
                        ),
                        _buildNavCard(
                          title: "Test",
                          icon: Icons.task,
                          color: Colors.redAccent,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // ===== LEFT SECTION (Reusable) =====
  Widget _leftSection(data, BuildContext context) {
    return Column(
      children: [
        _buildInfoCard(
          title: 'Assigned Crew & FTO',
          icon: Icons.badge_outlined,
          color: Colors.blueAccent,
          child: Column(
            children: [
              _buildDataRow('Flight Training Org:', data.assignedFto),
              const Divider(color: Colors.grey),
              _buildDataRow(
                  'Chief Instructor:', data.assignedInstructor),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Overall Study Progress',
          icon: Icons.analytics_outlined,
          color: Colors.teal,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      value: data.overallStudyProgress / 100,
                      strokeWidth: 8,
                      backgroundColor:
                          Colors.grey.withValues(alpha: 0.2),
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    '${data.overallStudyProgress}%',
                    style:
                        const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Keep pushing forward!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade700),
                      onPressed: () => context.push('/subjects'),
                      child: const Text('Continue Study'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }


  // ✅ ===== ONLY NEW METHOD ADDED =====
  Widget _buildNotificationPreview(BuildContext context, List notifications) {
    final unreadCount = notifications.where((n) => !n.isRead).length;

    return _buildInfoCard(
      title: 'Notifications',
      icon: Icons.notifications,
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                unreadCount == 0
                    ? "All caught up 🎉"
                    : "$unreadCount unread alerts",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => context.push('/notifications'),
                child: const Text("View All"),
              ),
            ],
          ),
          const SizedBox(height: 8),

          ...notifications.take(2).map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(
                    item.type == 'Flight'
                        ? Icons.airplanemode_active
                        : Icons.notifications,
                    size: 16,
                    color:
                        item.isRead ? Colors.grey : Colors.redAccent,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (!item.isRead)
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // ===== FLIGHT CARD =====
  Widget _flightCard(data) {
    return _buildInfoCard(
      title: 'Upcoming Scheduled Flight',
      icon: Icons.connecting_airports,
      color: Colors.orangeAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.upcomingFlight.lesson,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconLabel(
                  Icons.airplanemode_active,
                  data.upcomingFlight.aircraft),
              _buildIconLabel(
                  Icons.calendar_today,
                  data.upcomingFlight.date),
              _buildIconLabel(
                  Icons.access_time,
                  data.upcomingFlight.time),
            ],
          ),
        ],
      ),
    );
  }

  // ===== NAV CARD =====
  Widget _buildNavCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF131C2E),
          borderRadius: BorderRadius.circular(14),
          border:
              Border.all(color: Colors.grey.withValues(alpha: 0.15)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600)),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 12, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // ===== COMMON UI =====
  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131C2E),
        borderRadius: BorderRadius.circular(14),
        border:
            Border.all(color: Colors.grey.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.grey)),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildIconLabel(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}