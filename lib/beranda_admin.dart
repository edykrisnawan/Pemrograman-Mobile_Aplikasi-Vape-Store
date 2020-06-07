import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BerandaAdmin extends StatefulWidget {
  @override
  _BerandaAdminState createState() => _BerandaAdminState();
}

class _BerandaAdminState extends State<BerandaAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//update  AppBar

        appBar: new AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('THE VAPE STORE_IND'),
              ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Click  search');
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.add_shopping_cart),
            //   onPressed: () {
            //     print('Click  Shop');
            //   },
            // ),
          ],
        ),

//widget  Drawer
        drawer: new Drawer(
//menggunakan  listView  agar  drawer  dapat  melebihi  width  devices
          child: Container(
            color: Colors.black87,
            child: new ListView(
              children: <Widget>[
//Drawer  Header  diisi  dengan  informasi  akun
                new UserAccountsDrawerHeader(
                  accountName: new Text(
                    "Edy Totoy",
                    style: TextStyle(color: Colors.black87),
                  ),
                  accountEmail: new Text(
                    "edy@undiksha.ac.id",
                    style: TextStyle(color: Colors.black87),
                  ),
                  currentAccountPicture: new GestureDetector(
                    onTap: () {},
                    child: new CircleAvatar(
//mengambil  gambar  dari  internet  menggunakan  NetworkImage
                      backgroundImage:
                          new AssetImage('assets/appimages/edy.JPG'),
                    ),
                  ),
//memberi  background  pada  Drawer  Header
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/appimages/bg_profile.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
//Menu  Drawer
                new ListTile(
                  title: new Text(
                    'Notifications',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: new Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Wishlist',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: new Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Akun',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: new Icon(
                    Icons.verified_user,
                    color: Colors.white,
                  ),
                ),
//Divider  Menu
                Divider(
                  height: 2,
                ),
                new ListTile(
                  title: new Text(
                    'Setting',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: new Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: new Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                    Fluttertoast.showToast(
                        msg: "Anda Telah Logout",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
              ],
            ),
          ),
        ),

//Bagian Body
        body: ListView(
          children: <Widget>[
            Image.asset("assets/appimages/bg_profile.jpg"),
            Container(
              color: Colors.blueAccent[100],
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'THE VAPE STORE_IND',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text('Tempat Vape Store Terlengkap dan Termurah.',
                          style: TextStyle(
                            color: Colors.black,
                          ))
                    ],
                  ),
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Alamat      : Jln. Seririt-Singaraja, Kalianget, Seririt, Kab. Buleleng.\n\n'
                'Jam Buka : 09.00 - 22.00 WITA\n\n'
                'WhatApp   : 085857209987\n\n'
                'Instagram : thevapestore_ind',
                style: TextStyle(fontWeight: FontWeight.bold),
                softWrap: true,
              ),
            ),
          ],
        ));
  }
}
