import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title:new Text("Biodata"),),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('Halo $email',style: TextStyle(color: Colors.white),), accountEmail: null),
            new ListTile(
              title: new Text('Setting'),
              trailing: new Icon(Icons.settings),
            )
          ]),
        ),
        body: Center(
          child: new Text("Selamat Datang"),
        )

    );
  }
}
