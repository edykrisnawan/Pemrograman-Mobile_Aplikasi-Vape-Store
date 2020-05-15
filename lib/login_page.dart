import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:edy_project/member.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usr = new TextEditingController();
  TextEditingController psw = new TextEditingController();
  String msg = 'jfoejfeofjeof';

  Future<void> _login() async {
    final response = await http.post(
        "http://192.168.43.95/vape_store/index.php/Login/login_api",
        body: {
          "username": usr.text,
          "password": psw.text,
        });

    var datauser = json.decode(response.body);

    if (datauser['error'] == true) {
      setState(() {
        msg = datauser['msg'];
      });
    } else {
      String emailAPI = datauser['email'];
      String namaAPI = datauser['nama'];
      String id = datauser['id'];
      String photo = datauser['photo'];
      int level = int.parse(datauser['level']);

      setState(() {
        savePref(emailAPI, namaAPI, id, level, photo);
        msg = datauser['msg'];
      });

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Member()));
    }
  }

  savePref(
      String email, String nama, String id, int level, String photo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("nama", nama);
      preferences.setString("email", email);
      preferences.setString("id", id);
      preferences.setString("photo", photo);
      preferences.setInt("level", level);
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100,
        // backgroundImage: NetworkImage(
        //     'http://192.168.43.95/edy_project/assets/appimages/bg_profile.jpg'),
        child: Image.asset(
          'assets/appimages/bg_profile.jpg',
          width: 400,
          height: 400,
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: usr,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: psw,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(18),
        color: Colors.green,
        child: Text('Log In',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        onPressed: () {
          _login();
          // if (admin) {
          //   Navigator.of(context).pushNamed("/admin");
          // } else if (user) {
          //   Navigator.of(context).pushNamed("/user");
          // } else {
          //   Fluttertoast.showToast(
          //       msg: "Akun Tidak Ditemukan",
          //       toastLength: Toast.LENGTH_SHORT,
          //       gravity: ToastGravity.CENTER,
          //       timeInSecForIosWeb: 1,
          //       backgroundColor: Colors.blue,
          //       textColor: Colors.white,
          //       fontSize: 16.0);
          // }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 150, left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 40.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}
