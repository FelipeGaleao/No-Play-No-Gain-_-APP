import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:npngv4/app/cadastro/cadastro_controller.dart';
import 'package:npngv4/app/dashboard/dashboard_page.dart';
import 'package:npngv4/app/modules/home/home_page.dart';
import 'package:getflutter/getflutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:splashscreen/splashscreen.dart';

class UltimaPage extends StatefulWidget {
  final String title;
  final String doencaAfs;
  const UltimaPage({Key key, this.title = "Pagina2", this.doencaAfs}) : super(key: key);
  @override
  _UltimaPageState createState() => _UltimaPageState();
}

@override

class _UltimaPageState extends State<UltimaPage> {
  final databaseReference = Firestore.instance;
  final _nomeDoencaAfs = TextEditingController();
  final _Peso = TextEditingController();
  final _altura = TextEditingController();
  final _modalidade = TextEditingController();
  final cadastro = CadastroController();
  FirebaseUser mCurrentUser;
  FirebaseAuth _auth;
  String accountStatus = '******';
  String doencaAfs;

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
verificarinfo() async{
}
  Widget build(BuildContext context) {
   cadastro.verificarCadastro(mCurrentUser.email);
   return Observer(builder: (_) => atencao());
  }
  Widget atencao(){
    doencaAfs = cadastro.doencaAfs;
    print("STATUS A: " + cadastro.doencaAfs);
      if(doencaAfs == 'Sim'){
        return Scaffold(body: 
    SingleChildScrollView(
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
               DecoratedBox(
                 decoration: BoxDecoration(
                 color: Color.fromRGBO(207, 4, 4, 1.0),),
                 child: Container(
                 height: MediaQuery.of(context).size.width * 0.8, 
                 width: MediaQuery.of(context).size.width * 1.0
                 ),
               ),  
                Column(children: <Widget>[
                 Padding(padding: EdgeInsets.only(top: 120, left: 15),
                 child:                       Image(image: AssetImage('assets/logo_let_us_play.png')),

                 ),
               ],
               ),             
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[

               DecoratedBox(
                 decoration: BoxDecoration(
                 gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(207, 4, 4, 1.0), Color.fromRGBO(164, 31, 2, 1.0)])
              ),
                 child: Container(
                 height: MediaQuery.of(context).size.width * 1.37, 
                 width: MediaQuery.of(context).size.width * 1.0
                 ),
               ),   
                Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 0, left: 0),
                 child:                        Lottie.asset(
                'assets/avatar_enfermeira.json', width: 250, height: 200),
                 ),
                Padding(padding: EdgeInsets.only(top: 20), child:  Text("${mCurrentUser.displayName}, você disse sim para as perguntas anteriores \n portanto, aconselhamos você a procurar \n um profissional da saúde.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.signika(
                      textStyle:
                          TextStyle(color: Colors.white, letterSpacing: .5))),),
                  GFButton(
                                              onPressed: () {
               verificarinfo();
                                                Navigator.pushNamedAndRemoveUntil(context, '/dashboard', ModalRoute.withName('/'));
                                              },
                                              color: Color.fromRGBO(
                                                  141, 28, 3, 1),
                                              child: Text(
                                                  "Estou ciente e desejo continuar por conta e risco",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
               ],
               ),             
              ],
            )
          ],
        ),
      ],),
    ),
    );
      }else{
        return Scaffold(body: 
    SingleChildScrollView(
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
               DecoratedBox(
                 decoration: BoxDecoration(
                 color: Color.fromRGBO(153, 204, 51, 1.0),),
                 child: Container(
                 height: MediaQuery.of(context).size.width * 0.8, 
                 width: MediaQuery.of(context).size.width * 1.0
                 ),
               ),  
                Column(children: <Widget>[
                 Padding(padding: EdgeInsets.only(top: 120, left: 15),
                 child:                       Image(image: AssetImage('assets/logo_let_us_play.png')),

                 ),
               ],
               ),             
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
               DecoratedBox(
                 decoration: BoxDecoration(
                 gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(153, 204, 51, 1.0), Color.fromRGBO(110, 164, 2, 1.0)])
              ),
                 child: Container(
                 height: MediaQuery.of(context).size.width * 1.37, 
                 width: MediaQuery.of(context).size.width * 1.0
                 ),
               ),   
                Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 0, left: 0),
                 child:                   
                 GestureDetector(onTap: (){
               verificarinfo();
                                                Navigator.pushNamedAndRemoveUntil(context, '/dashboard', ModalRoute.withName('/'));
                 }, child:   Lottie.asset(
                'assets/avatar_edilson.json', width: 200, height: 200),
                 ),),
                Padding(padding: EdgeInsets.only(top: 20), child:  Text("${mCurrentUser.displayName}, já salvei suas informações. \n Toca em mim!!",
                textAlign: TextAlign.center,
                  style: GoogleFonts.signika(
                      textStyle:
                          TextStyle(color: Colors.white, letterSpacing: .5, fontSize: 18)),),
                ),
               ],
               ),             
              ],
            )
          ],
        ),
      ],),
    ),
    );
      }
  }
}
