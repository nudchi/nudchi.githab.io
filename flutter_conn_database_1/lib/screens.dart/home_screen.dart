import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conn_database/screens.dart/Artist.dart';
import '../model/Transactions.dart';
import 'package:flutter_conn_database/providers/transaction_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Artist"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget) {
            var count = provider
                .transactions.length; //นับจำนวนข้อมูล เช็คข้อมูลมีหรือไม่
            if (count <= 0) {
              //ตัวเช็ค
              return Center(
                child: Text(
                  "ไม่พบข้อมูลArtist",
                  style: TextStyle(fontSize: 20),
                ),
              );
            } else {
              return ListView.builder(
                  //เพิ่มรูปโค้ดด้านล่างนี้ //แสดงตามรายละเอียดที่กำหนด
                  itemCount: count,
                  itemBuilder: (context, int index) {
                    Transactions data = provider.transactions[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      child: ListTile(
                          leading: Image.network(
                            "${data.img}",
                          ),
                          title: Text(data.title),
                          subtitle:
                              Text(DateFormat("dd/MM/yyyy").format(data.date)),
                          trailing: Icon(Icons.arrow_forward_rounded),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetailsScreen(data)));
                          }),
                    );
                  });
            }
          },
        ));
  }
}
