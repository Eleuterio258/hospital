import 'package:flutter/material.dart';
import 'package:hospital/common/colors.dart';
import 'package:hospital/services/authentication_service.dart';
import '../admin/home_admin.dart';
import '../paciente/home_screen.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final emailE = TextEditingController();
  final senhaE = TextEditingController();
  bool _isHidden = true;

  @override
  void dispose() {
    super.dispose();
    emailE.dispose();
    senhaE.dispose();
  }

  bool continuedConnected = false; //variavel para o controlo do botao
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                topColor,
                bottomColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image.asset(
                //   "assets/hospital.png",
                //   height: 100,
                // ),
                Text(
                  "Entrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailE,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                            Icons.mail_outlined,
                            color: Colors.white,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: senhaE,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: Icon(
                            Icons.vpn_key_sharp,
                            color: Colors.white,
                          ),
                          suffix: IconButton(
                            icon: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: _togglePasswordView,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: topColor,
                          title: new Text("Redefinir a senha"),
                          content: TextFormField(
                            controller: emailE,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "E-mail",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                "Enviar",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Esqueceu a Senha?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: this.continuedConnected,
                      onChanged: (bool newValue) {
                        setState(() {
                          this.continuedConnected = newValue;
                          print(this.continuedConnected);
                        });
                      },
                    ),
                    Text(
                      "Continuar conectado?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    AuthenticationService.logar(emailE.text, senhaE.text);
                  },
                  child: Text("Entrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  login() {
    if (emailE.text == "admin@admin.com" && senhaE.text == "123456") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeAdmin(),
        ),
      );
    } else if (emailE.text == "paciente@paciente.com" &&
        senhaE.text == "123456") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
      );
    }
  }
}
