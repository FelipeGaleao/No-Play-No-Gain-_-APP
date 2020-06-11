import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:npngv4/app/cadastro/cadastro_page.dart';
import 'home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

class HomePage extends StatefulWidget {
  final String title;


  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final _emailLogin = TextEditingController();
  final _passLogin = TextEditingController();
  @override
 

  Widget build(BuildContext context) {
    return  Scaffold(
      body: new Container(
      width: 800, // specific value
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0), 
      colors: [const Color.fromARGB(255, 153, 204, 51), const Color.fromARGB(255, 153, 204, 20)], 
      tileMode: TileMode.repeated, 
    ),
        ),
      height: double.infinity,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 110, 50, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Image.network(
  'https://i.imgur.com/uVQoHKP.png'),
              ),
   Padding(
                padding: const EdgeInsets.fromLTRB(50, 100, 0, 0),
child: 
 Container(
     decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    )
  ),
  width: 380, // specific value
  height: 60,
  child: RaisedButton(
    color: Color.fromARGB(100, 115, 153, 38),
    child: Row(children: <Widget>[
        Icon(
      Icons.account_box,
      color: Colors.white,
      size: 48.0,
    ),
      Text("Logar com o Google", textAlign: TextAlign.center,  style: GoogleFonts.signika(textStyle: TextStyle(color: Colors.white, letterSpacing: .5))
  ),
    ],),
     onPressed: () {
    signInWithGoogle().whenComplete(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return CadastroPage();
          },
        ),
      );
    });}
),
   ),
   ),
  
            ],
      ),
    ),
        ),
    ),
    );
  }
}
