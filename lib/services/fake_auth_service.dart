import 'package:timos_customer_2025/models/user.dart';

class FakeAuthService {
  static final List<AppUser> _users = <AppUser>[
    const AppUser(username: 'manager@timos.vn', password: '123456', role: 1),
    const AppUser(username: 'driver@timos.vn', password: '123456', role: 2),
  ];

  static AppUser? _currentUser;

  static AppUser? get currentUser => _currentUser;

  static Future<AppUser?> signIn({
    required String username,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    try {
      final AppUser user = _users.firstWhere(
        (AppUser u) => u.username == username && u.password == password,
      );
      _currentUser = user;
      return user;
    } catch (_) {
      return null;
    }
  }

  static void signOut() {
    _currentUser = null;
  }
}
