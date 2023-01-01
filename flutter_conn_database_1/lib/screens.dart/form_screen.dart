// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/transaction_provider.dart';
import 'package:flutter_conn_database/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final imgController = TextEditingController();
  final titleController = TextEditingController();
  final birthdayController = TextEditingController();
  final hometownController = TextEditingController();
  final nationalityController = TextEditingController();
  final positionController = TextEditingController();
  final heightController = TextEditingController();
  final igController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เเบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "เพิ่มรูปภาพ"),
                  autofocus: true,
                  controller: imgController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อ"),
                  controller: titleController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "วันเกิด"),
                  controller: birthdayController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "บ้านเกิด"),
                  controller: hometownController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "สัญชาติ"),
                  controller: nationalityController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ตำแหน่ง"),
                  controller: positionController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ส่วนสูง"),
                  controller: heightController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "IG"),
                  controller: igController,
                ),
                FlatButton(
                  child: Text("เพิ่มข้อมูล"),
                  color: Colors.pink,
                  textColor: Colors.white,
                  onPressed: () {
                    var img = imgController.text;
                    var title = titleController.text;
                    var birthday = birthdayController.text;
                    var hometown =hometownController.text;
                    var nationality = nationalityController.text;
                    var position = positionController.text;
                    var height = heightController.text;
                    var ig = igController.text;

                    //print(title);
                    //print(amount);

                    //เตรียมข้อมูล
                    Transactions statement = Transactions(
                        img: img,
                        title: title,
                        birthday: birthday,
                        hometown: hometown,
                        nationality: nationality,
                        position: position,
                        height: height,
                        ig: ig,
                        date: DateTime.now());

                    //เรียกprovider
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) {
                              return MyHomePage(
                                title: 'hi',
                              );
                            }));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
