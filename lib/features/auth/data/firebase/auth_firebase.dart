import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebase {
  static Future<ResultFirebase<bool>> register({
    required UserModel user,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.passwared,
      );
      return Success(true);
    } on FirebaseAuthException catch (e) {
      return Error(e.toString());
    } catch (e) {
      return Error(e.toString());
    }
  }

  static Future<ResultFirebase<bool>> logIn({
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
