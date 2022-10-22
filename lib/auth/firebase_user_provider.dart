import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MyTaskManagerFirebaseUser {
  MyTaskManagerFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MyTaskManagerFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MyTaskManagerFirebaseUser> myTaskManagerFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MyTaskManagerFirebaseUser>(
      (user) {
        currentUser = MyTaskManagerFirebaseUser(user);
        return currentUser!;
      },
    );
