import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/model/user_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  static CollectionReference<UserDto> get _collection => FirebaseFirestore
      .instance
      .collection("users")
      .withConverter<UserDto>(
        fromFirestore: (snapshot, options) =>
            UserDto.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
  Future<ResultFirebase<bool>> _addUser(UserDto user) async {
    try {
      await _collection.doc(user.uid).set(user);
      return Success(true);
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<ResultFirebase<bool>> register({required UserDto user}) async {
    try {
      UserCredential cridntional = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email ?? "",
            password: user.password ?? "",
          );
      user.uid = cridntional.user!.uid;
      var res = await _addUser(user);
      switch (res) {
        case Success<bool>():
          return Success(true);
        case Error<bool>():
          return Error("Error from store the user on database");
      }
    } on FirebaseAuthException catch (e) {
      return Error(e.toString());
    } catch (e) {
      return Error(e.toString());
    }
  }

  Future<ResultFirebase<bool>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(true);
    } on FirebaseAuthException catch (e) {
      return Error(e.toString());
    } catch (e) {
      return Error(e.toString());
    }
  }
}
