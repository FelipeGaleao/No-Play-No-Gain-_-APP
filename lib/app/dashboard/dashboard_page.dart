import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:health/health.dart';
import 'package:lottie/lottie.dart';

import 'dashboard_controller.dart';

final dashboard = DashboardController();
final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>(); // ADD THIS LINE

class DashboardPage extends StatefulWidget {
  final String title;

  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Timer timer;
  String accountStatus = '******';
  String dataType;
  int dateFrom;
  int dateTo;
  FirebaseUser mCurrentUser;
  double passosTotal;
  String platform;
  String unit;
  num value;

  FirebaseAuth _auth;
  final dashboard = DashboardController();

  void initState() {
    super.initState();
    passosTotal = 0;
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    initUser();
   timer = Timer.periodic(Duration(seconds: 5), (Timer t) => setState((){
         dashboard.verificarPassos();
   }));
  
  }
@override
void dispose() {
  timer.cancel();
  super.dispose();
}
  _getCurrentUser() async {
    mCurrentUser = await _auth.currentUser();
    setState(() {});
  }

  initUser() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dashboard.verificarPassos();
    return Scaffold(
      key: _scaffoldKey, // ADD THIS LINE
      backgroundColor: Color.fromRGBO(153, 204, 51, 1),
      drawer: GFDrawer(
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            GFDrawerHeader(
              decoration: new BoxDecoration(
                color: Color.fromRGBO(153, 204, 51, 1),
              ),
              currentAccountPicture: GFAvatar(
                radius: 80.0,
                backgroundImage:
                    NetworkImage("${mCurrentUser.photoUrl.toString()}"),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${mCurrentUser.displayName.toString()}',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold))),
                  Text('${mCurrentUser.email.toString()}',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal))),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Página inicial'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.score),
              title: Text('Minha evolução'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.remove_circle_outline),
              title: Text('Sair'),
              onTap: null,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30),
                decoration: new BoxDecoration(
                   color: Color.fromRGBO(153, 204, 51, 1)),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                  onPressed: () {
                                    _scaffoldKey.currentState.openDrawer();
                                  }, // CHANGE THIS LINE,
                                  icon: Icon(Icons.menu,
                                      color: Colors.white, size: 36.0)),
                            ],
                          ),
                          Positioned(child: 
                          Column(children: <Widget>[
                            GestureDetector(child:Lottie.network('https://assets1.lottiefiles.com/packages/lf20_SENZv4.json', height: 256), onTap: (){
                              dashboard.verificarPassos();
                            },),
                            Text("Super herói iniciante",
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                          fontWeight: FontWeight.normal,
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 28))),
                                                             Text("Você deve atingir a meta de passos diários para \n avançar de nível",
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                          fontWeight: FontWeight.normal,
                                                          color: Colors.white70,
                                                          letterSpacing: .5,
                                                          fontSize: 12)), textAlign: TextAlign.center,),
                          ],), top: 120, left: 50),
                          Container(
                            width: double.infinity,
                            height: 550,
                            padding: EdgeInsets.only(top: 0),
                          ),
                          Positioned(child:   
Container(
child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
Container(child: 
Column(children: <Widget>[
GFButtonBadge(
    onPressed: (){},
    color: Color.fromRGBO(118, 174, 6, 1),
    text: "Normal",
    textStyle: new TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 14),
    size: GFSize.SMALL
 ),
 Column(children: <Widget>[
  Padding(padding: EdgeInsets.only(top: 5), child: Text("Missão",
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          fontWeight: FontWeight.normal,
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 18))),
  ),
],
)
],
)
 ),
 Container(padding: EdgeInsets.only(left: 30, right: 30),child: 
Column(children: <Widget>[
Row(children: <Widget>[
  Icon(Icons.score, color: Colors.white, size: 36),
  Observer(
                          builder: (_) =>
                              Text(dashboard.passosTotal.toString(), 
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                          letterSpacing: .5,
                                                          fontSize: 18)))),
                

],)
],
)
 ), 
 Container(child: 
Column(children: <Widget>[
GFButtonBadge(
    onPressed: (){},
    text: "427",
    size: GFSize.SMALL
 ),
 Column(children: <Widget>[
  Padding(padding: EdgeInsets.only(top: 5), child: Text("Experiência"),
  ),
],
)
],
)
 ),
],
)
),
 top: 450, left: 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: Color(0xFFFEFEFE)),
                  child: Atividades(),
                ),
            ],
          )),
    );
  }
  Widget Atividades(){
    return 
      SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, left: 40, bottom: 30),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Column(children: <Widget>[
              Text("Atividades",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Colors.black54,
                                                      letterSpacing: .5,
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight
                                                          .bold)))
            ],),
          ],
          ),
          Padding(padding: EdgeInsets.only(top: 30), child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Column(children: <Widget>[
              Container(
                child:             CircleAvatar(
                radius: 36.0,
                backgroundImage:
                    NetworkImage('https://media-cdn.tripadvisor.com/media/photo-i/13/7c/7e/b0/img-20180623-151525743.jpg'),
                backgroundColor: Colors.transparent,
              )
              )
            ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(padding: EdgeInsets.only(left: 15), child: Column(children: <Widget>[
                Text("Caminhada no parque",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.black38,
                                                      letterSpacing: .0,
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight
                                                          .bold))),
                                                          Text("7-9 minutos",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.black38,
                                                      letterSpacing: .0,
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight
                                                          .normal))),
                ],),)
            ],
            ),
              Column(
              mainAxisAlignment: MainAxisAlignment.end,  
              children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 90),
                child:               Text("+457 pts",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.green,
                                                      letterSpacing: .0,
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight
                                                          .normal))),
              )
            ],
            ),
          ],
          ),
          ),    
          Padding(padding: EdgeInsets.only(top: 30), child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Column(children: <Widget>[
              Container(
                child:             CircleAvatar(
                radius: 36.0,
                backgroundImage:
                    NetworkImage('https://media-cdn.tripadvisor.com/media/photo-i/13/7c/7e/b0/img-20180623-151525743.jpg'),
                backgroundColor: Colors.transparent,
              )
              )
            ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(padding: EdgeInsets.only(left: 15), child: Column(children: <Widget>[
                Text("Caminhada no parque",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.black38,
                                                      letterSpacing: .0,
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight
                                                          .bold))),
                                                          Text("7-9 minutos",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.black38,
                                                      letterSpacing: .0,
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight
                                                          .normal))),
                ],),)
            ],
            ),
              Column(
              mainAxisAlignment: MainAxisAlignment.end,  
              children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 90),
                child:               Text("+457 pts",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.green,
                                                      letterSpacing: .0,
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight
                                                          .normal))),
              )
            ],
            ),
          ],
          ),
          ),  
        
          Padding(padding: EdgeInsets.only(top: 30), child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Column(children: <Widget>[
              Container(
                child:             CircleAvatar(
                radius: 36.0,
                backgroundImage:
                    NetworkImage('https://media-cdn.tripadvisor.com/media/photo-i/13/7c/7e/b0/img-20180623-151525743.jpg'),
                backgroundColor: Colors.transparent,
              )
              )
            ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(padding: EdgeInsets.only(left: 15), child: Column(children: <Widget>[
                Text("Caminhada no parque",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.black38,
                                                      letterSpacing: .0,
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight
                                                          .bold))),
                                                          Text("7-9 minutos",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.black38,
                                                      letterSpacing: .0,
                                                      fontSize: 12.0,
                                                      fontWeight: FontWeight
                                                          .normal))),
                ],),)
            ],
            ),
              Column(
              mainAxisAlignment: MainAxisAlignment.end,  
              children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 90),
                child:               Text("+457 pts",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color: Colors.green,
                                                      letterSpacing: .0,
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight
                                                          .normal))),
              )
            ],
            ),
          ],
          ),
          ),  
        ],
      ),
    );
  }
}
