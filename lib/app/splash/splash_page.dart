import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:npngv4/app/modules/home/home_page.dart';
import 'package:lottie/lottie.dart';
class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      title: new Text('Executando abdominais...', style: TextStyle(fontSize: 18.0, color: Colors.white),),
      image: Image(image: AssetImage('assets/logo let_us_play.png')),
      backgroundColor: Color.fromRGBO(134, 178, 10, 300),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.white
    );
  }
}