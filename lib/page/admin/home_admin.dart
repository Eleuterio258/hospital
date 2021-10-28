import 'package:flutter/material.dart';
import 'package:hospital/common/drawer_compont.dart';
import 'package:hospital/model/user_model.dart';
import 'package:hospital/page/login/login_screen.dart';

class HomeAdmin extends StatelessWidget {
  final UserModel user;
  const HomeAdmin({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.notifications_active), onPressed: () {}),
            IconButton(
              icon: Icon(Icons.vpn_key),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
              },
            )
          ],
          title: const Text('ADMIN'),
        ),
        drawer: DrawerCompont(),
        body: Center());
  }
}
