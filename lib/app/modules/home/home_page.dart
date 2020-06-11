import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
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
  FirebaseUser mCurrentUser;
  FirebaseAuth _auth;
  String accountStatus = '******';

  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    initUser();
  }

  _getCurrentUser() async {
    mCurrentUser = await _auth.currentUser();
    setState(() {});
  }

  initUser() async {
    setState(() {});
  }

  verificarLogin() {
    if (mCurrentUser == null) {
      print("Usuário não logado");
    } else {
      Navigator.pushReplacementNamed(context, '/cadastro');
    }
  }

  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => verificarLogin());
    return Scaffold(
      bottomNavigationBar: RaisedButton(
          color: Color.fromRGBO(115, 153, 38, 1),
          padding: EdgeInsets.fromLTRB(100, 10, 0, 20),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.account_box,
                color: Colors.white,
                size: 48.0,
              ),
              Text("Continuar com o Google",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.signika(
                      textStyle:
                          TextStyle(color: Colors.white, letterSpacing: .5))),
            ],
          ),
          onPressed: () {
            signInWithGoogle().whenComplete(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return CadastroPage();
                  },
                ),
              );
            });
          }),
      body: new Container(
        width: 800, // specific value
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0),
            colors: [
              const Color.fromARGB(255, 153, 204, 51),
              const Color.fromARGB(255, 153, 204, 20)
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        height: double.infinity,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 200),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:
                      Image(image: AssetImage('assets/logo_noplay_nogain.png')),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    width: 150, // specific value
                    height: 60,
                  ),
                ),
                Container(
                  child: Text(
                    "faça login para continuar",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 18)), // light
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Lottie.network('https://api.lottiefiles.com/v2/force-download-file?url=https://assets1.lottiefiles.com/private_files/lf30_jx5cQ6.json'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 100, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    width: 380, // specific value
                    height: 60,
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
