
import 'package:toga/features/auth/data/models/cadet_profile.dart';

class AuthService {
  /// Simulates a POST request to /auth/login
  Future<CadetProfile> login() async {
    // Mock network latency
    await Future.delayed(const Duration(seconds: 2));

    // Return the required mock user data
    return CadetProfile(
      name: 'Arjun Menon',
      role: 'Cadet',
      course: 'PPL',
      fto: 'AIRMAN Flight Academy',
      instructor: 'Capt. R. Sharma',
      base: 'Chennai',
    );
  }

  /// Simulates clearing the mock session
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}