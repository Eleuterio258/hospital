import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospital/page/paciente/home_screen.dart';
import 'package:hospital/page/register/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  void initState() {
    verificaLogin().then((value) => {
          if (value)
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }))
            }
          else
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }))
            }
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(72, 104, 96, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.local_shipping, size: 100, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Future<bool> verificaLogin() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") != null) {
      return true;
    } else {
      return false;
    }
  }
}
