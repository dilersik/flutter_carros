class User {
  final String login;
  final String name;
  final String email;
  final String token;
  final List<String> roles;

  User({
    required this.login,
    required this.name,
    required this.email,
    required this.token,
    required this.roles,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      login: map["login"] as String,
      name: map["nome"] as String,
      email: map["email"] as String,
      token: map["token"] as String,
      roles: getRoles(map),
    );
  }

  @override
  String toString() {
    return "User $login; $name; $email; $token; $roles";
  }

  static getRoles(Map<String, dynamic> map) {
    final roles = map["roles"];
    if (roles is List) {
      return roles.map<String>((role) => role.toString()).toList();
    }
    return [];
  }
}
