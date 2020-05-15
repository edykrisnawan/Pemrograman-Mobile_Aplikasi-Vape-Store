import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
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
              ],
            ),
          ),
        ),

//Bagian Body
        body: ListView(
          children: <Widget>[
            Container(
              height: 200,
              child: Carousel(
                boxFit: BoxFit.fill,
                images: [
                  Image.asset('assets/appimages/hexomv3.jpg'),
                  Image.asset('assets/appimages/foxy.jpg'),
                  Image.asset('assets/appimages/foxy2.jpg'),
                  Image.asset('assets/appimages/aegissolo.jpg'),
                  Image.asset('assets/appimages/aegisx.jpg'),
                  Image.asset('assets/appimages/eco.jpg'),
                  Image.asset('assets/appimages/aegislegend.jpg'),
                  Image.asset('assets/appimages/puma.jpg'),
                ],
                indicatorBgPadding: 3.5,
                dotColor: Colors.red,
                // dotBgColor: Colors.yellowAccent,
              ),
            ),
            Container(
              color: Colors.blueAccent[100],
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'THE VAPE STORE_IND',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          ' ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text(
                    '215',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //untuk membuat tampilan secara vertikal maka digunakan column
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "CALL",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.chat, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "CHAT",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.near_me, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "ROUTE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.share, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Alamat      : Jln. Seririt-Singaraja, Kalianget, Seririt, Kab. Buleleng.\n\n'
                'Jam Buka : 09.00 - 22.00 WITA\n\n'
                'Telepon     : 085857209987\n\n'
                'Instagram : thevapestore_ind',
                style: TextStyle(fontWeight: FontWeight.bold),
                softWrap: true,
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   child: TextField(
            //     decoration: new InputDecoration(
            //       hintText: "Tulis Masukkan Anda...",
            //       labelText: "Masukkan",
            //       border: OutlineInputBorder(gapPadding: 2),
            //       fillColor: Colors.grey[100],
            //       filled: true,
            //       suffixIcon: Icon(
            //         Icons.send,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // )
          ],
//seluruh  body  dibungkus  column
//Tidak  terdapat  perubahan  pada  body  beranda.dart  latihan  4  /tugas  4  sebelumnya body:  new  ListView()
        ));
  }
}
