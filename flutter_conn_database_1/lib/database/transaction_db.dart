import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../model/Transactions.dart';
//import 'package:flutter_conn_database/model/Transactions.dart';

class TransactionDB {
  //บริการเกี่ยวกับฐานข้อมูล
  String dbname;

//ถ้ายังไม่สร้าง จะสร้าง
//ถูกสร้างเเล้ว  ให้เปิด
  TransactionDB({required this.dbname});

  Future<Database> openDatabase() async {
    //หาต่ำเเหน่งที่จัดเก็บข้อมูล
    Directory appDirectory =
        await getApplicationDocumentsDirectory(); //หาตำเเหน่ง user account
    String dbLocation = join(appDirectory.path, dbname);

//สร้างฐานข้อมูล
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูล
  Future<int> insertData(Transactions statement) async {
//ฐานข้อมูล => store
//transaction.db =>expense
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense"); //ตั้งชื่อตาราง

    //json
    var keyID = store.add(db, {
      //ตัวแปร
      "img": statement.img,
      "title": statement.title,
      "birthday": statement.birthday,
      "hometown": statement.hometown,
      "nationality": statement.nationality,
      "position": statement.position,
      "height": statement.height,
      "ig": statement.ig,
      "date": statement.date.toIso8601String()
    });
    db.close();
    return keyID;
  }

  //สร้าง method ดึงข้อมูล
  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    //test print snapshot
    //print(snapshot);
    //List transactionList = <Transactions>[];
    List<Transactions> transactionList = <Transactions>[];
    //ดึงข้อมูลที่ละเเถว
    for (var record in snapshot) {
      transactionList.add(Transactions(
          img: record["img"].toString(),
          title: record["title"].toString(),
          birthday: record["birthday"].toString(),
          hometown: record["hometown"].toString(),
          nationality: record["nationality"].toString(),
        position: record["position"].toString(),
          height: record["height"].toString(),
          ig: record["ig"].toString(),
          date: DateTime.parse(record["date"].toString())));
    }
    return transactionList;
  }
}
