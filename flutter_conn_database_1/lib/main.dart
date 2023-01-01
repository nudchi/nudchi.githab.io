import 'package:flutter/material.dart';
import 'package:flutter_conn_database/providers/transaction_provider.dart';
import 'package:flutter_conn_database/screens.dart/form_screen.dart';
import 'package:flutter_conn_database/screens.dart/home_screen.dart';
import 'package:flutter_conn_database/screens/form_screen.dart';
import 'package:flutter_conn_database/screens/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'model/Transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const MyHomePage(title: 'Artist'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: TabBarView(
          children: [
            HomeScreen(),
            FormScreen()
          ], //ชื่อคลาส วิ่งไปหาชื่อตามที่ใส่
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.list),
              text: "หน้าแรก",
            ),
            Tab(icon: Icon(Icons.add), text: "เพิ่มข้อมูล"),
          ],
        ),
      ),
    );
  }
}
