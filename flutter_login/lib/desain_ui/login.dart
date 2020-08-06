import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dashboard.dart';
import 'dart:async';

String nama='';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyLogin(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context)=>new Dashboard(nama: nama,),
        '/MyLogin': (BuildContext context)=>new MyLogin(),
      },
    );
  }
}

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController email= new TextEditingController();
  TextEditingController password= new TextEditingController();

  String pesan = '';
  Future<List> _login() async{
    final response = await http.post("http://192.168.43.54/mobile/flutter/flutter_login/login.php", body: {
      "email":email.text,
      "password":password.text,
    });
    var datauser= json.decode(response.body);
    if(datauser.length==0){
      setState(() {
        pesan="Login Gagal";
      });
    }else{
      Navigator.pushReplacementNamed(context, '/dashboard');
      setState(() {
        nama=datauser[0]['nama'];
      });
    }
    return datauser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            gradient:LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blue[900],
                  Colors.blue[800],
                  Colors.blue[400]
                ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                    SizedBox(height: 10,),
                    Text("Silahkan login", style: TextStyle(color: Colors.white, fontSize: 18),),
                    SizedBox(height: 10,)
                  ],
                )
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(0, 10)
                          )]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border( bottom: BorderSide(color: Colors.grey[200])),
                              ),
                              child: TextField(
                                controller: email,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border( bottom: BorderSide(color: Colors.grey[200])),
                              ),
                              child: TextField(
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      ButtonTheme(
                        minWidth: 250.0,
                        height: 45.0,
                        child: RaisedButton(
                          child: new Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),),
                          color: Colors.lightBlue[500],
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: (){
                            _login();
                          }
                        ),
                      ),
                      Text(pesan, style: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
