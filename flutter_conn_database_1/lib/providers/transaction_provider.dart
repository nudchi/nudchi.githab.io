import 'package:flutter/foundation.dart';
import 'package:flutter_conn_database/database/transaction_db.dart';
import 'package:flutter_conn_database/model/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

//ดึงข้อมูลมาเเสดงตอนเริ่ม
  void initData() async {
    var db = TransactionDB(dbname: "transactions.db"); //แก้ชื่อตามของเรา
    //ดึงข้อมูลมาเเสดง
    //List Transactions = await db.loadAllData();
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbname: "transactions.db");

    //บันทึกข้อมูล
    await db.insertData(statement);
    //ดึงข้อมูลมาเเสดงผล
    //List Transactions = await db.loadAllData();
    transactions = await db.loadAllData();

    // insert ข้อมูลเข้าไปใน statement
    // transactions.insert(0, statement);

    //เเจ้งเตือน consumer
    notifyListeners();
  }
}
