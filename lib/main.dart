import 'package:flutter/material.dart';
//import  halaman  yang  akan  diload  kemudian  beri  alias
import './beranda.dart' as beranda;
import './listproduk.dart' as listproduk;
import 'package:carousel_pro/carousel_pro.dart';

//Top  Level/Root
void main() {
//harus  menggunakan  MaterialApp
  runApp(new MaterialApp(
    title: "tab  Bar",
    home: new MyApp(),
  ));
}

//jangan  lupa  menggunakan  StatefulWidget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

//jangan  lupa  panggil  juga  SingleTickerProviderStateMixin
class _MyAppState extends State<MyApp> {
//ini  variabel  controller  untuk  mengatur  tabbar
  PageController controller;
  int index = 0;
//jangan  lupa  tambahkan  initState  untuk  inisialisasi  dan  mengaktifkan  tab
  @override
  void initState() {
    controller = PageController(keepPage: true);
    super.initState();
  }

//jangan  lupa  tambahkan  dispose  untuk  berpindah  halaman
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//gunakan  widget  Scaffold
    return Scaffold(
//widget  TabBarView
        body: new PageView(
//terdapat  controller  untuk  mengatur  halaman
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: <Widget>[
//pemanggilan  halaman  dimulai  dari  alias.className  halaman  yang  diload
            new beranda.Beranda(),
            new listproduk.ListProduk(),
          ],
        ),
//membuat  bottom  tab
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            currentIndex: index,
            onTap: (int choice) {
              controller.jumpToPage(choice);
              setState(() {
                index = choice;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Beranda")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), title: Text("List Produk")),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.account_circle), title: Text("Akun")),
            ]));
  }
}
