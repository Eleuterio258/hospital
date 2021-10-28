import 'package:flutter/material.dart';

class ProfilePaciente extends StatelessWidget {
  const ProfilePaciente({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 32,
          child: Text("P", style: TextStyle(fontSize: 32)),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Paciente', style: TextStyle(fontSize: 20)),
            Text('4101410141', style: TextStyle(fontSize: 14))
          ],
        )
      ],
    );
  }
}
