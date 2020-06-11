import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({});
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'NoPlayNoGain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
