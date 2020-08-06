import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlogin/desain_ui/login.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHome(),
    );
  }
}
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topCenter,
              colors: [
                Colors.blue[900],
                Colors.blue[800],
                Colors.blue[400]
              ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top :200),
            ),
            Text("Selamat Datang Di", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
            Text("Sistem Pengaduan Masyarakat", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            Padding(
              padding: EdgeInsets.only(top :200),
            ),
            RaisedButton(
              color: Colors.amber,
              child: Text("Login"),
              onPressed: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext)=>new Login()
                  ))

              ,)
          ],
        )
    )
    );
  }
}