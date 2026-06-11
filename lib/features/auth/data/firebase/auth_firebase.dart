import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  Future<ResultFirebase<bool>> register({required UserModel user}) async {
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

  Future<ResultFirebase<bool>> logIn({required UserModel user}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
}
