import 'package:chat_app/features/search/domain/entity/search_user_entity.dart';

class SearchUserDto {
  SearchUserDto({
    this.email,
    this.phoneNumber,
    this.uid,
    this.name,
    this.password,
  });

  String? email;
  String? phoneNumber;
  String? uid;
  String? password;
  String? name;

  factory SearchUserDto.fromJson(Map<String, dynamic> jsonData) {
    return SearchUserDto(
      email: jsonData['email'] ?? "",
      phoneNumber: jsonData['phoneNumber'] ?? "",
      uid: jsonData['uid'] ?? "",
      name: jsonData['name'] ?? "",
      password: jsonData['password'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'name': name,
      'password': password,
    };
  }

  SearchUserEntity toEntity() {
    return SearchUserEntity(
      email: email ?? "",
      phoneNumber: phoneNumber ?? "",
      uid: uid ?? "",
      name: name ?? "",
    );
  }
}
