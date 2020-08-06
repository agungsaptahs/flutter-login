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
                Colors.orange[900],
                Colors.orange[800],
                Colors.orange[400]
              ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),)
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}