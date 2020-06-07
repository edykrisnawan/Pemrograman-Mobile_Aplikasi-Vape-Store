import 'package:edy_project/login_page.dart';
import 'package:edy_project/ui/admin/mainAdmin.dart';
import 'package:flutter/material.dart';

import 'ui/user/mainUser.dart';

//Top  Level/Root
void main() {
//harus  menggunakan  MaterialApp
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "tab  Bar",
    initialRoute: "/login",
    routes: {
      "/user": (context) => MyAppUser(),
      "/login": (context) => LoginPage(),
      "/admin": (context) => MyAppAdmin(),
    },
  ));
}

//jangan  lupa  menggunakan  StatefulWidget
