import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:toga/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:toga/features/logbook/presentation/screen/logbook_screen.dart';
import 'package:toga/features/notes/presentation/screens/notes_screen.dart';
import 'package:toga/features/notifications/presentation/screen/notification_screen.dart';
import 'package:toga/features/study/presentation/screens/subject_screen.dart';

import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/subjects',
        builder: (context, state) => const SubjectsScreen(), // ✅ fixed
      ),
      GoRoute(
        path: '/notes',
        builder: (context, state) => const NotesScreen(),
      ),
      GoRoute(
        path: '/logbook',
        builder: (context, state) => const LogbookScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
    ],
    redirect: (context, state) {
      final loggingIn = state.matchedLocation == '/login';
      final user = authState.value;

      if (user == null) {
        return loggingIn ? null : '/login';
      }

      if (loggingIn) {
        return '/dashboard';
      }

      return null;
    },
  );
}