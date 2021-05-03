import 'package:firebase_auth/firebase_auth.dart';
import 'error_codes.dart';

class UserRepository {
  FirebaseAuth firebaseAuth;

  UserRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<User> registerUserWithEmailPass(String email, String pass) async {
    String authError = '';
    try {
      UserCredential authResult =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return authResult.user;
    } catch (e) {
      switch (e.code) {
        case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
          authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
          break;
        case ErrorCodes.ERROR_USER_NOT_FOUND:
          authError = ErrorMessages.ERROR_USER_NOT_FOUND;
          break;
        case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
          authError = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
          break;
        case ErrorCodes.ERROR_INVALID_EMAIL:
          authError = ErrorMessages.ERROR_INVALID_EMAIL;
          break;
        case ErrorCodes.ERROR_CODE_USER_DISABLED:
          authError = ErrorMessages.ERROR_CODE_USER_DISABLED;
          break;
        case ErrorCodes.ERROR_CODE_WRONG_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WRONG_PASSWORD;
          break;
        case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
          authError = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
          break;
        case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
          authError = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
          break;
        default:
          authError = ErrorMessages.DEFAULT;
          break;
      }
      throw Exception(authError);
    }
  }

  Future<User> loginWithEmailAndPassword(String email, String password) async {
    String authError = '';
    try {} on FirebaseAuthException catch (e) {
      switch (e.code) {
        case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
          authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
          break;
        case ErrorCodes.ERROR_USER_NOT_FOUND:
          authError = ErrorMessages.ERROR_USER_NOT_FOUND;
          break;
        case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
          authError = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
          break;
        case ErrorCodes.ERROR_INVALID_EMAIL:
          authError = ErrorMessages.ERROR_INVALID_EMAIL;
          break;
        case ErrorCodes.ERROR_CODE_USER_DISABLED:
          authError = ErrorMessages.ERROR_CODE_USER_DISABLED;
          break;
        case ErrorCodes.ERROR_CODE_WRONG_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WRONG_PASSWORD;
          break;
        case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
          authError = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
          break;
        case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
          authError = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
          break;
        case ErrorCodes.ERROR_CODE_WEAK_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WEAK_PASSWORD;
          break;
        default:
          authError = ErrorMessages.DEFAULT;
          break;
      }
      throw Exception(authError);
    }
  }

  // sign out
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  // check signIn
  bool isLoggedIn() {
    User currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }

  // get current user
  User getCurrentUser() {
    User currentUser = FirebaseAuth.instance.currentUser;
    return currentUser;
  }
}
