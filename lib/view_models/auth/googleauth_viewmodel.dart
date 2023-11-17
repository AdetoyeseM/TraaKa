import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GoogleSignInViewModel {
  final BehaviorSubject<User?> _user = BehaviorSubject<User?>.seeded(null);
  Stream<User?> get usersDetails => _user.stream;
  updateUserDetails(User? e) => _user.sink.add(e!);
}
