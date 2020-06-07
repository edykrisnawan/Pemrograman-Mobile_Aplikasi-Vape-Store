import 'package:edy_project/beranda_admin.dart';
import 'package:edy_project/listproduk.dart';
import 'package:edy_project/ui/admin/homeAdmin.dart';
import 'package:flutter/material.dart';

class MyAppAdmin extends StatefulWidget {
  @override
  _MyAppAdminState createState() => _MyAppAdminState();
}

//jangan  lupa  panggil  juga  SingleTickerProviderStateMixin
class _MyAppAdminState extends State<MyAppAdmin> {
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
            new BerandaAdmin(),
            new ListProduk(),
            new Home(),
          ],
        ),
//membuat  bottom  tab
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit), title: Text("Input Barang")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("Akun")),
            ]));
  }
}
