class SearchUserEntity {
  SearchUserEntity({
    required this.email,
    required this.phoneNumber,
    required this.uid,
    required this.name,
  });

  final String email;
  final String phoneNumber;
  String uid;
  final String name;
}
