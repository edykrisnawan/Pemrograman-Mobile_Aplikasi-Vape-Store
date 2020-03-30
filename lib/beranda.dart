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
                Text('VAPOR STORES IND'),
              ]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Click  search');
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {
                print('Click  start');
              },
            ),
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
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',
                softWrap: true,
              ),
            )
          ],
//seluruh  body  dibungkus  column
//Tidak  terdapat  perubahan  pada  body  beranda.dart  latihan  4  /tugas  4  sebelumnya body:  new  ListView()
        ));
  }
}
