import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({this.nama});
  final String nama;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title:new Text("Dashboard"),),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text('Halo $nama',style: TextStyle(color: Colors.white),), accountEmail: new Text('')),
            new ListTile(
              title: new Text('Logout'),
              trailing: new Icon(Icons.arrow_back),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/MyLogin');
              },
            )
          ]),
        ),
        body: Center(
          child: new Text("Selamat Datang $nama"),
        )

    );
  }
}
