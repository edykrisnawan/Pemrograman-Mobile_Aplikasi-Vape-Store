import 'package:edy_project/beranda.dart';
import 'package:edy_project/listproduk.dart';
import 'package:edy_project/login_page.dart';
import 'package:edy_project/ui/admin/mainAdmin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/user/homeUser.dart';

class Member extends StatefulWidget {
  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<Member> with SingleTickerProviderStateMixin {
  String id, nama, email, photo;
  int level = 0;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      level = preferences.getInt("level");
      id = preferences.getString("id");
      nama = preferences.getString("nama");
      email = preferences.getString("email");
      photo = preferences.getString("photo");
    });
  }

  TabController controller;

  @override
  void initState() {
    super.initState();
    getPref();

    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (level) {
      case 1:
        return MyAppAdmin();
        break;

      case 2:
        return Scaffold(
          body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new Beranda(),
              new ListProduk(),
              new Home(),
            ],
          ),
          bottomNavigationBar: new Material(
            color: Colors.blue,
            child: new TabBar(
              controller: controller,
              tabs: <Widget>[
                new Tab(icon: new Icon(Icons.home)),
                new Tab(icon: new Icon(Icons.list)),
              ],
            ),
          ),
        );
        break;

      default:
        return LoginPage();
    }
  }
}
