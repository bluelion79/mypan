import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MyPANFirebaseUser {
  MyPANFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

MyPANFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MyPANFirebaseUser> myPANFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MyPANFirebaseUser>((user) => currentUser = MyPANFirebaseUser(user));
