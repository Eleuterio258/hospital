import 'package:flutter/material.dart';

class DrawerCompont extends StatelessWidget {
  final userName;
  final email;

  DrawerCompont({Key key, this.userName, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                child: Text(
              userName[0],
              style: TextStyle(fontSize: 65),
            )),
            accountName: Text(userName),
            accountEmail: Text(email),
          ),
          ListTile(title: Text("Principal"), leading: Icon(Icons.home)),
          ListTile(title: Text("Pagamntos"), leading: Icon(Icons.payment)),
          ListTile(title: Text("Configurações"), leading: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
