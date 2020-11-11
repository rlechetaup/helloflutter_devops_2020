import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.network("https://e7.pngegg.com/pngimages/758/928/png-clipart-computer-icons-user-profile-theater-front-face-monochrome.png"),
              ),
              accountName: Text("Ricardo"),
              accountEmail: Text("rlecheta@gmail.com"),
            ),
            ListTile(
              title: Text(
                "Meus Dados",
                style: TextStyle(color: Colors.blue),
              ),
              leading: Icon(Icons.star),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("Config"),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("Ajuda"),
              leading: Icon(Icons.help),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("Sair"),
              leading: Icon(Icons.help),
              trailing: Icon(Icons.arrow_right),
            )
          ],
        ),
      ),
    );
  }
}
