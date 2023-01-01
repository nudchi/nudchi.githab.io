import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:intl/intl.dart';
import 'package:sembast/sembast.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Transactions data;
  MovieDetailsScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          ///ชิดขอบ
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //จัดรูปร่าง
            children: [
              Image.network("${data.img}"),
              Card(
                elevation: 15,
                color: Colors.pink,
                child: ListTile(title: Text("ชื่อ : " + data.title)),
              ),
              Card(
                elevation: 15,
                color: Colors.pink,
                child: ListTile(title: Text("วันเกิด : " + data.birthday)),
              ),
              Card(
                elevation: 15,
                color: Colors.pink,
                child: ListTile(title: Text("บ้านเกิด : " + data.hometown)),
              ),
              Card(
                elevation: 15,
                color: Colors.pink,
                child: ListTile(title: Text("สัญชาติ : " + data.nationality)),
              ),
              Card(
                elevation: 15,
                color: Colors.pink,
                child: ListTile(title: Text("ตำแหน่ง : " + data.position)),
              ),
              Card(
                elevation: 15,
                color: Colors.pink,
                child: ListTile(title: Text("ส่วนสูง : " + data.height)),
              ),
              Card(
                elevation: 15,
                color: Colors.pink,
                child:
                    ListTile(title: Text("IG : " + data.ig)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
