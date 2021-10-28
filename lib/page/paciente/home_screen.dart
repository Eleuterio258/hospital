import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/common/colors.dart';
import 'package:hospital/common/profile_paciente.dart';
import 'package:hospital/model/user_model.dart';
import 'package:hospital/page/login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;

  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.vpn_key),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 64,
                      margin: EdgeInsets.only(bottom: 20),
                      child: ProfilePaciente()),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                size: 100,
                                color: Colors.amberAccent,
                              ),
                              Text(
                                'Consultas',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.person_add,
                                size: 100,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                'Marcar',
                                style: cardTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 120,
            child: Text(
              "10",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
