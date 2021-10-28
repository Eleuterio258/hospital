import 'package:flutter/foundation.dart';

class UserModel {
  final email;
  final name;
  final nomeCompleto;
  final passsword;
  final morrado;
  final imagePerfil;
  final role;
  final dataNascimento;

  UserModel({
    @required this.name,
    @required this.email,
    this.nomeCompleto,
    this.passsword,
    this.morrado,
    this.imagePerfil,
    this.dataNascimento,
    this.role,
  });
}
