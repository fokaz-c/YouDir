import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:youdir/backend/hiveAdapter/hiveDB.dart';

void main() async {
  await Hive.initFlutter();
  await Hivedb.instance.init();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final dirNameTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: TextField(controller: dirNameTC, decoration: const InputDecoration(hintText: "Directory Name"),),
          ),
          TextButton(onPressed: ()async {
            await Hivedb.instance.addDir(name: dirNameTC.text);
            setState(() {
            });
          }, child: const Text("Add directory")),
          TextButton(onPressed: ()async {
            var dir = await  Hivedb.instance.getDir(id: 0);
            log("Received db at 0 is ${dir.name}");
          }, child: const Text("Get dirs"))
        ],)
      ),
    );
  }
}
