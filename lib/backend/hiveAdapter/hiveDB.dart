import 'dart:convert';
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:youdir/backend/interfaces/iDB.dart';
import 'package:youdir/models/directoryModel.dart';

class Hivedb implements IDB {
  late Box dirTable;

  Hivedb._();

  static Hivedb instance = Hivedb._();

  Future<void> init() async {
    dirTable = await Hive.openBox("dirTable");
  }

  @override
  Future<void> addDir({required String name, String desc = ""}) async {
    int id = dirTable.length;
    log("Adding new direction $name with desc $desc and ID $id");
    DirectoryModel dir = DirectoryModel(
        id: id,
        name: name,
        created: DateTime.now(),
        updated: DateTime.now(),
        desc: desc);

    await dirTable.put(id, dir.toMap());

    var dd = await dirTable.get(id);
    log("Addeddir = ${jsonEncode(dd)}");
  }

  //TODO: Build this function (use getkeys and loop and check parent ID)
  @override
  Future<DirectoryModel> getDir({required int id}) async {
    var map = await dirTable.get(id);
    return convertMaptoDirectoryModel(map);
  }
  @override
  Future<List<DirectoryModel>> getDirs({int parentDirID = -1}) {
    // TODO: implement getDirs
    throw UnimplementedError();
  }


  //Helpers
  DirectoryModel convertMaptoDirectoryModel(dynamic map){
    return DirectoryModel(
        id: map["id"] as int,
        name: map["name"] as String,
        created: DateTime.parse(map["created"] as String),
        updated: DateTime.parse(map["updated"] as String),
        desc: map["desc"] as String,
        parentDirID: map["parentDirID"] as int);
  }
}
