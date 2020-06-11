import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:npngv4/app/cadastro/cadastro_controller.dart';
import 'package:npngv4/app/modules/home/home_page.dart';
import 'package:getflutter/getflutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroPage extends StatefulWidget {
  final String title;

  const CadastroPage({Key key, this.title = "Cadastro"})
      : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final cadastrocontroller = CadastroController();
  final databaseReference = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  String genero;
  final _codReferencia = TextEditingController();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _cidade = TextEditingController();
  final _UF = TextEditingController();
  final _dataNascimento = TextEditingController();
  @override
  void initState() {
    super.initState();
    genero = "";
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    _nome.text = user.displayName;
    _email.text = user.email;
    setState(() {});
  }
  void createRecord() async {
    await databaseReference.collection("informacoes")
        .document("${user.email}")
        .setData({
      'codigo_referencia': _codReferencia.text,
      'usuario': user.email,
      'nome': user.displayName,
      'genero': genero,
      'cidade': _cidade.text,
      'UF': _UF.text,
      'DataNascimento': _dataNascimento.text,
    });
    Navigator.pushNamed(context, '/cadastro/pagina2');
  }
   String cadastro;

  Widget build(BuildContext context) {
  cadastrocontroller.direcionar(user.email);
  cadastrocontroller.verificarCadastro(user.email);
  if(cadastrocontroller.doencaAfs == null){
    return Observer(builder: (_) => Ndirecionar());
  }else{
    return Observer(builder: (_) => direcionar());
     }
  }
  Widget direcionar(){
      return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: 
                          Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(child: Lottie.asset('assets/avatar_edilson.json'), onTap: (){
                                                Navigator.pushNamedAndRemoveUntil(context, '/cadastro/ultima_pagina/:doencaAfs', ModalRoute.withName('/'));
                              }),                  
                            ],
                          )
                          ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20)),
                Text("Clique em mim para continuar!", style: TextStyle(fontSize: 18)),      
                 ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
  Widget Ndirecionar(){
    return  Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Container(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 350),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 200, 0),
                                          child: Text("Passo 1/4",
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
                                              bottom: 15, right: 100),
                                          child: Text(
                                              "Precisamos saber mais sobre você",
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
                                            alignment: Alignment.topCenter,
                                            padding: const EdgeInsets.symmetric(horizontal: 90),
                                            child: CircleAvatar(
                                                radius: 96,
                                                backgroundImage: NetworkImage(
                                                    "${user.photoUrl}"))),
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 40),
                                                      child:  Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                             width: 150,
                                              height: 70,
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 20),
                                              child: GFButton(
                                                onPressed: () {
                                                  setState(() {
                                                    genero = "Feminino";
                                                    print(genero);
                                                  });
                                                },
                                                color: genero == "Masculino" ? Colors.grey : Color.fromRGBO(153, 204, 51, 1),
                                                child: Text(
                                                    "Feminino",
                                                    style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, letterSpacing: .5, fontSize: 14))),// light
                                                shape: GFButtonShape.pills,
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              height: 70,
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 20),
                                              child: GFButton(
                                                onPressed: () {
                                                  setState(() {
                                                    genero = "Masculino";
                                                    print(genero);
                                                  });
                                                },
                                                color: genero == "Feminino" ? Colors.grey : Color.fromRGBO(153, 204, 51, 1),
                                                child: Text(
                                                  "Masculino",
                                                  style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, letterSpacing: .5, fontSize: 14))),// light
                                                shape: GFButtonShape.pills,
                                              ),
                                            ),
                                          ],
                                        ),
                                         alignment: Alignment.center),
                                        Row(children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.only(
                                              top: 10
                                            ),
                                            width: (MediaQuery.of(context).size.width)-30,
                                            height: 60,
                                            child:
                                            TextField(
                                              controller: _nome,
                                              readOnly: true,
                                              decoration: new InputDecoration(
                                                hintText: 'Nome',
                                                fillColor: Colors.green,
                                                contentPadding:
                                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.green),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey[300]),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),

                                              ),
                                            ),
                                          ),
                                        ],
                                        ),
                                        Row(children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 5
                                            ),
                                            width: (MediaQuery.of(context).size.width)-30,
                                            height: 60,
                                            child:
                                            TextField(
                                              controller: _email,
                                              readOnly: true,
                                              decoration: new InputDecoration(
                                                hintText: 'Nome',
                                                fillColor: Colors.green,
                                                contentPadding:
                                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.green),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey[300]),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                        ),
                                        Row(children: <Widget>[
                                          Container(
                                            alignment: Alignment.topLeft,
                                            width: (MediaQuery.of(context).size.width)/(14/10),
                                            height: 60,
                                            child:
                                            TextField(
                                              controller: _cidade,
                                              decoration: new InputDecoration(
                                                hintText: 'Minha cidade',
                                                fillColor: Colors.green,
                                                contentPadding:
                                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.green),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey[300]),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                              ),
                                            ),
                                          ),
                                       Container(
                                            alignment: Alignment.topLeft,
                                            width: (MediaQuery.of(context).size.width)/(50/10),
                                            height: 60,
                                            padding: EdgeInsets.only(left: 5),
                                            child:
                                            TextField(
                                              controller: _UF,
                                              decoration: new InputDecoration(
                                                hintText: 'UF',
                                                fillColor: Colors.green,
                                                contentPadding:
                                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.green),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey[300]),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                        ),
                                        Row(children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.only(left: 0, right: 15),
                                            width: (MediaQuery.of(context).size.width)-10,
                                            height: 60,
                                            child:
                                            TextFormField(
                                              controller: _dataNascimento,
                                              keyboardType: TextInputType.datetime,
                                              onTap: () async{
                                                DateTime date = DateTime(1900);
                                                FocusScope.of(context).requestFocus(new FocusNode());

                                                date = await showDatePicker(
                                                    context: context,
                                                    initialDate:DateTime.now(),
                                                    firstDate:DateTime(1900),
                                                    lastDate: DateTime(2100));
                                                String ano = date.year.toString();
                                                String mes = date.month.toString();
                                                String dia = date.day.toString();
                                                _dataNascimento.text = dia + '/' + mes + '/' + ano;},
                                              decoration: new InputDecoration(
                                                hintText: 'Data de Nascimento',
                                                fillColor: Colors.green,
                                                contentPadding:
                                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.green),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey[300]),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                        ),
  Row(children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.only(left: 0, right: 15),
                                            width: (MediaQuery.of(context).size.width)-10,
                                            height: 60,
                                            child:
                                            TextFormField(
                                              controller: _codReferencia,
                                              decoration: new InputDecoration(
                                                hintText: 'Código de referência',
                                                fillColor: Colors.green,
                                                contentPadding:
                                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.green),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey[300]),
                                                  borderRadius: BorderRadius.circular(5.7),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                        ),

                                        Row(children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.only(left: 0, right: 0),
                                            width:  (MediaQuery.of(context).size.width)/(40/10),
                                            height: 60,
                                            child:
                                            GFToggle(
                                              onChanged: (val){},
                                              value: null,
                                              type: GFToggleType.square,
                                            )
                                          ),
                                          Text("Estou ciente dos Termos de Uso \n e Desejo  continuar", textAlign: TextAlign.center),
                                        ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              color: Colors.transparent,
                                              width: (MediaQuery.of(context).size.width)-40,
                                              height: 60,
                                              child: FlatButton(
                                                shape: new RoundedRectangleBorder(
                                                  borderRadius: new BorderRadius.circular(30.0),
                                                ),
                                                onPressed: () {
                                                  createRecord();
                                                       super.dispose();
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
                                            )
                                          ],
                                        )
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
          )),
    );
  }
}
