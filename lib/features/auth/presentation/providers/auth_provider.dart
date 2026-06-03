import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toga/features/auth/data/models/cadet_profile.dart';
import 'package:toga/features/auth/data/services/auth_services.dart';

part 'auth_provider.g.dart'; // ✅ FIXED path

@riverpod
AuthService authService(Ref ref) {
  return AuthService();
}

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<CadetProfile?> build() {
    return const AsyncData(null);
  }

  Future<void> login() async {
    state = const AsyncLoading();
    try {
      final service = ref.read(authServiceProvider);
      final profile = await service.login();
      state = AsyncData(profile);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    final service = ref.read(authServiceProvider);
    await service.logout();
    state = const AsyncData(null);
  }
}