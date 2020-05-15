import 'dart:convert';
import 'package:edy_project/ui/admin/detail.dart';
import 'package:edy_project/ui/admin/inputData.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//untuk menampung jumlah data
  int count = 0;
//memanggil fungsi api
  Future<List> getData() async {
//request data penjualan
//sesuaikan dengan ip address, pastikan webserver aktif, dan fungsi sesuai dengan studi kasus
    final response =
        await http.get('http://192.168.43.95/vape_store/index.php/Penjualan');
//convert kedalam json
    return json.decode(response.body);
  }

  Future deletePenjualan(id) async {
    await http.delete(
        "http://192.168.43.95/vape_store/index.php/Penjualan/delete/$id");
    setState(() {});
  }

  @override
//membuat widget body
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Input Data Vape Dan Liquid"),
      ),
//menampilkan data dalam fungsi createListView
//sama seperti pada modul 2
      body: createListView(),
//tombol add
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Input Penjualan',
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (BuildContext contex) => AddData()))
              .then((value) => {setState(() {})});
        },
      ),
    );
  }

//sebuah fungsi untuk menampilkan data dalam listview
  Widget createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
//updateListView();
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.connectionState == ConnectionState.none)
            return Container();
          else {
//membuat sebuah data list untuk menampung data penjualan
            List penjualanList = snapshot.data;
            return ListView.builder(
              itemCount: penjualanList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  elevation: 2.0,
//anggota list
                  child: ListTile(
                    title: Text(
                      penjualanList[index]['nama'],
                      style: textStyle,
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Text(penjualanList[index]['tanggal']
                            .toString()
                            .toString()),
                        Text(
                          " | Rp. " + penjualanList[index]['harga'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
//icon delete
                    trailing: GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () async {
                        await deletePenjualan(penjualanList[index]['id']);
                        Fluttertoast.showToast(
                            msg: "Data Telah Dihapus.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                    ),
//klik list untuk tampilkan form update
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Detail(
                                list: penjualanList,
                                index: index,
                              )));
                    },
                  ),
                );
              },
            );
          }
        });
  }
}
