class AppUser {
  final String username;
  final String password;
  final int role; // 1: manager, 2: driver

  const AppUser({
    required this.username,
    required this.password,
    required this.role,
  });

  bool isManager() => role == 1;
  bool isDriver() => role == 2;
}
