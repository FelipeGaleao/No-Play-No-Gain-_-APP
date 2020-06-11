import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:npngv4/app/cadastro/pagina2/ultima_page.dart';
import 'package:npngv4/app/modules/home/home_page.dart';
import 'package:getflutter/getflutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pagina2Page extends StatefulWidget {
  final String title;
  const Pagina2Page({Key key, this.title = "Pagina2"}) : super(key: key);
  @override
  _Pagina2PageState createState() => _Pagina2PageState();

}
@override
class _Pagina2PageState extends State<Pagina2Page> {
  String doencaAfs;
  String problemaCardiaco;
  String dorPeito;
  String ultimaDorNoPeito;
  String perdaEquilibrio;
  String problemaOsseo;
  String medicamentoPressao;
  String recomendacaoAfs;
  final databaseReference = Firestore.instance;
  final _nomeDoencaAfs = TextEditingController();
  final _Peso = TextEditingController();
  final _altura = TextEditingController();
  final _modalidade = TextEditingController();
  FirebaseUser mCurrentUser;
  FirebaseAuth _auth;
  String accountStatus = '******';
  String campoVazio;
  void initState() {
    super.initState();
    problemaCardiaco = "";
    medicamentoPressao = "";
    campoVazio = "";
    problemaOsseo = "";
    perdaEquilibrio = "";
    ultimaDorNoPeito = "";
    dorPeito = "";
    recomendacaoAfs = "";
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    initUser();
  }
  _getCurrentUser () async {
    mCurrentUser = await _auth.currentUser();
    setState(() {
    });
  }
  initUser() async {
    setState(() {});
  }


  void createRecord(String username) async {
    await databaseReference.collection("informacoes")
        .document("${username}")
        .updateData({
      'codigo_referencia': "TesteFabricio",
      'pesoInicial': _Peso.text,
      'doencaAfs': doencaAfs,
      'alturaInicial': _altura.text,
      'recomendacaoAfs': recomendacaoAfs,
      'dorPeito': dorPeito,
      'perdaEquilibrio': perdaEquilibrio,
      'problemaOsseo': problemaOsseo,
      'medicamentoPressao': medicamentoPressao,
      'problemaCardiaco': problemaCardiaco
    });
  }
  void validarForm(){
    if(perdaEquilibrio == "" || problemaOsseo == "" || medicamentoPressao == "" || problemaCardiaco == "" || dorPeito == "" || recomendacaoAfs == ""){
      campoVazio = "Sim";
    }
   if(perdaEquilibrio == 'Sim' || problemaOsseo == 'Sim' || medicamentoPressao == 'Sim' || problemaCardiaco == 'Sim' || dorPeito == 'Sim' || recomendacaoAfs == 'Sim'){
      print('Tem um zoado');
            doencaAfs = "Sim";
                  createRecord(mCurrentUser.email);
            Modular.to.pushNamed('/cadastro/ultima_pagina/Sim');
    }
    else{
            doencaAfs = "Não";
                        createRecord(mCurrentUser.email);
      Modular.to.pushNamed('/cadastro/ultima_pagina/Não');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 10, 30),
          child: Container(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 330, 20),
                        child: IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: Colors.black, size: 36.0))),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 200, 0),
                                        child: Text("Passo 2/4",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    letterSpacing: .5,
                                                    fontSize: 36.0,
                                                    fontWeight: FontWeight
                                                        .bold))), // light
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, right: 150),
                                        child: Text(
                                            "Entendendo melhor você...",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    letterSpacing: .5,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight
                                                        .normal))), // light
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 25, top: 54),
                                        child:
                                        FutureBuilder(
                                          future: FirebaseAuth.instance
                                              .currentUser(),
                                          builder: (context, AsyncSnapshot<
                                              FirebaseUser> snapshot) {
                                            if (snapshot.hasData) {
                                              return Lottie.asset('assets/logo_avatar.json', width: 256, height:256);
                                            }
                                            else {
                                              return Text('Loading...');
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 20),
                                        child:
                                        Text(
                                          "Alguém já lhe disse que você possui problema cardíaco \n e que somente deve realizar atividade \n física  recomendada por um médico?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  letterSpacing: .5,
                                                  fontSize: 14)
                                          ), // light
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 25, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  problemaCardiaco = "Sim";
                                                  print(problemaCardiaco);
                                                });
                                              },
                                              color: problemaCardiaco == "Não" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Sim",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  problemaCardiaco = "Não";
                                                  print(problemaCardiaco);
                                                });
                                              },
                                              color: problemaCardiaco == "Sim" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Não",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                        ],
                                      ),
                                         Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 20),
                                        child:
                                        Text(
                                          "Você possui alguma doença que possa \n influênciar em sua prática de atividade física?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  letterSpacing: .5,
                                                  fontSize: 14)
                                          ), // light
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 25, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  dorPeito = "Sim";
                                                  print(dorPeito);
                                                });
                                              },
                                              color: dorPeito == "Não" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Sim",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  dorPeito = "Não";
                                                  print(dorPeito);
                                                });
                                              },
                                              color: dorPeito == "Sim" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Não",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 20),
                                        child:
                                        Text(
                                          "No último mês, você teve dor no peito quando não estava \n realizando uma atividade física?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  letterSpacing: .5,
                                                  fontSize: 14)
                                          ), // light
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 25, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  ultimaDorNoPeito = "Sim";
                                                  print(ultimaDorNoPeito);
                                                });
                                              },
                                              color: ultimaDorNoPeito == "Não" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Sim",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  ultimaDorNoPeito = "Não";
                                                  print(ultimaDorNoPeito);
                                                });
                                              },
                                              color: ultimaDorNoPeito == "Sim" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Não",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 20),
                                        child:
                                        Text(
                                          "Você perdeu o equilibrio ou já desmaiou?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  letterSpacing: .5,
                                                  fontSize: 14)
                                          ), // light
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 25, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  perdaEquilibrio = "Sim";
                                                  print(perdaEquilibrio);
                                                });
                                              },
                                              color: perdaEquilibrio == "Não" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Sim",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  perdaEquilibrio = "Não";
                                                  print(perdaEquilibrio);
                                                });
                                              },
                                              color: perdaEquilibrio == "Sim" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Não",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 20),
                                        child:
                                        Text(
                                          "Você tem algum problema ósseo ou articular que \n poderia ser agravado pela prática de atividade física?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  letterSpacing: .5,
                                                  fontSize: 14)
                                          ), // light
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 25, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  problemaOsseo = "Sim";
                                                  print(problemaOsseo);
                                                });
                                              },
                                              color: problemaOsseo == "Não" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Sim",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  problemaOsseo = "Não";
                                                  print(problemaOsseo);
                                                });
                                              },
                                              color: problemaOsseo == "Sim" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Não",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                        ],
                                      ),
                                        Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 20),
                                        child:
                                        Text(
                                          "Seu médico está lhe receitando atualmente medicamentos \n para pressão arterial ou algum problema \n cardíaco?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  letterSpacing: .5,
                                                  fontSize: 14)
                                          ), // light
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 25, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  medicamentoPressao = "Sim";
                                                  print(medicamentoPressao);
                                                });
                                              },
                                              color: medicamentoPressao == "Não" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Sim",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  medicamentoPressao = "Não";
                                                  print(medicamentoPressao);
                                                });
                                              },
                                              color: medicamentoPressao == "Sim" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Não",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                        ],
                                      ),
                                             Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 20),
                                        child:
                                        Text(
                                          "Você está a par de alguma outra razão pela qual não \n deveria praticar uma atividade física?",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  letterSpacing: .5,
                                                  fontSize: 14)
                                          ), // light
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 25, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  recomendacaoAfs = "Sim";
                                                  print(recomendacaoAfs);
                                                });
                                              },
                                              color: recomendacaoAfs == "Não" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Sim",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 20),
                                            child: GFButton(
                                              onPressed: () {
                                                setState(() {
                                                  recomendacaoAfs = "Não";
                                                  print(recomendacaoAfs);
                                                });
                                              },
                                              color: recomendacaoAfs == "Sim" ? Colors
                                                  .grey : Color.fromRGBO(
                                                  153, 204, 51, 1),
                                              child: Text(
                                                  "Não",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14))),
                                              // light
                                              shape: GFButtonShape.square,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 20, right: 0),
                                            width: 360,
                                            child:
                                            _buildChild(),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 360,
                                            child:
                                            TextFormField(
                                              controller: _Peso,
                                              keyboardType: TextInputType.number,
                                              decoration: new InputDecoration(
                                                hintText: 'Qual é o seu peso atual?',
                                                fillColor: Colors.green,
                                                contentPadding:
                                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.green),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 360,
                                            child:
                                            TextFormField(
                                              controller: _altura,
                                              keyboardType: TextInputType.number,
                                              decoration: new InputDecoration(
                                                hintText: 'Minha altura atualmente é...',
                                                fillColor: Colors.green,
                                                contentPadding:
                                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.green),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: alerta(),)
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.only(left: 0.0, bottom: 0.0, top: 50.0),
                                            color: Colors.transparent,
                                            width: (MediaQuery.of(context).size.width)-40,
                                            height: (MediaQuery.of(context).size.height)/8,
                                            child: FlatButton(
                                              shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(30.0),
                                              ),
                                              onPressed: () {
                                                validarForm();
//                                                createRecord('${mCurrentUser.email.toString()}');
                                              },
                                              color: Color.fromRGBO(153, 204, 51, 1),
                                              child: Text(
                                                "Próxima etapa",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Raleway',
                                                  fontSize: 22.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget alerta(){
    if(campoVazio == "Sim"){
      print('há respostas vazias');
      return(
          GFToast(
        text:'This item already has the label “travel”',
        button: GFButton(
          onPressed: () {},
          text: 'Close',
          type: GFButtonType.transparent,
          color: Colors.green,
        ),
        autoDismiss: true,
      )
      );
    }
  }
  Widget _buildChild() {
    if (doencaAfs == 'Sim') {
      return TextField(
        controller: _nomeDoencaAfs,
        onEditingComplete: () {
        print(_nomeDoencaAfs.text);
          },
        decoration: new InputDecoration(
          hintText: 'Quais?',
          fillColor: Colors.green,
          contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(5.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.7),
          ),
        ),
      );
    }
  }
}