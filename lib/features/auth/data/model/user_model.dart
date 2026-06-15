import 'package:chat_app/features/auth/domain/entity/user_entity.dart';

class UserModel {
  UserModel({this.email, this.phoneNumber, this.uid, this.name, this.password});

  String? email;
  String? phoneNumber;
  String? uid;
  String? password;
  String? name;

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
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

  UserEntity toEntity() {
    return UserEntity(
      email: email ?? "",
      phoneNumber: phoneNumber ?? "",
      uid: uid ?? "",
      name: name ?? "",
      password: password ?? "",
    );
  }
}
