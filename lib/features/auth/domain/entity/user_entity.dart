class UserEntity {
  UserEntity({
    required this.email,
    required this.phoneNumber,
    required this.uid,
    required this.name,
    required this.password,
  });

  final String email;
  final String phoneNumber;
  final String password;
  String uid;
  final String name;
}
