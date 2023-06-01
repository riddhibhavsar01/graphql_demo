import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Authentication{

  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? name;
  String? imageUrl;

final FirebaseAuth _auth = FirebaseAuth.instance;

late bool authSignedIn;
late String? uid;
late String? userEmail;

Future<String> registerWithEmailPassword(String email, String password) async {



  // Initialize Firebase
  await Firebase.initializeApp();

  final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User? user = userCredential.user;

  if (user != null) {
    // checking if uid or email is null
    assert(user.uid != null);
    assert(user.email != null);

    uid = user.uid;
    userEmail = user.email;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    return 'Successfully registered, User UID: ${user.uid}';
  }

  return "";
}


Future<String> signInWithEmailPassword(String email, String password) async {
  // Initialize Firebase
  await Firebase.initializeApp();

  final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User? user = userCredential.user;

  if (user != null) {
    // checking if uid or email is null
    assert(user.uid != null);
    assert(user.email != null);

    uid = user.uid;
    userEmail = user.email;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User? currentUser = _auth.currentUser;
    assert(user.uid == currentUser?.uid);

    setLogIn(true);
    setUserInfo(user);
    return 'Successfully logged in, User UID: ${user.uid}';
  }

  return "";
}


Future<String> signOut() async {
  await _auth.signOut();

  setLogIn(false);

  uid = null;
  userEmail = null;

  return 'User signed out';
}


  Future<User?> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user != null) {
      // Checking if email and name is null
      assert(user.uid != null);
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser?.uid);
      setLogIn(true);
      setUserInfo(user);
      return user;
    }

    return null;
  }


  void signOutGoogle() async {
    await googleSignIn.signOut();
    await _auth.signOut();
    setLogIn(false);

    uid = null;
    name = null;
    userEmail = null;
    imageUrl = null;

    print("User signed out of Google account");
  }

  Future getUser() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    bool authSignedIn = await isLogged().then((value) => value);

    final User? user = _auth.currentUser;

    if (authSignedIn == true) {
      if (user != null) {
        uid = user.uid;
        name = user.displayName;
        userEmail = user.email;
        imageUrl = user.photoURL;
      }
    }
  }

  Future<bool> isLogged() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool('auth') ?? false;
    } catch (e) {
      return false;
    }
  }

   setLogIn(bool login) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('auth',login) ;
   }

   setUserInfo(User user) async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('userName',user.displayName ?? "User name") ;
   }

  Future<String?> getUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString('userName') ;
  }



}

abstract class BaseBloc {
  void dispose();
}
