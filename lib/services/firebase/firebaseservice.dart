import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:voice_chat_room/firebase_options.dart';
import 'package:voice_chat_room/models/user_model.dart';

class FirebaseService {
  static final _auth = FirebaseAuth.instance;
  static final _stor = FirebaseFirestore.instance;
  static UserModel? _currentUser;
  static UserModel get currentUser {
    if (_currentUser == null) {
      throw Exception(
          '_currentUserModel must not be null when calling this getter');
    }
    return _currentUser!;
  }
  
  // initial firebase
  static Future<void> setupFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  static Stream<QuerySnapshot> get buildViews {
     return  _stor.collection('users').snapshots();

  }

  static userSignUp({
    required String name,
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final creatUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final UserModel user =
          UserModel(name: name, userName: userName, password: password,email: email);
      // check the user data not null
      if (creatUser.user != null) {
        final docRef = _stor.collection('users').doc(creatUser.user!.uid);
        final doc = await docRef.get(); // to check if user found
        //  user is already found
        if (doc.exists) {
          return false;
        }
        // User not found and signUp
        await docRef.set(user.toJson());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final loginUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (loginUser.user != null) {
        final doc =
            await _stor.collection('users').doc(loginUser.user!.uid).get();
        final data = doc.data();

        if (data != null) {
          _currentUser = UserModel.fromJson(data);
          return true;
        }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
