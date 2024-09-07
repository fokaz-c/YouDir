import 'package:youdir/models/iModel.dart';

class DirectoryModel implements IModel<DirectoryModel> {
//  id,name,created, updated, desc
  int id;
  String name;
  String desc;
  DateTime created;
  DateTime updated;
  int parentDirID;

  DirectoryModel(
      {required this.id,
      required this.name,
      this.desc = "",
      required this.created,
      required this.updated,
      this.parentDirID = -1});

  @override
  DirectoryModel fromMap(Map<String, Object> map) {
    DirectoryModel directoryModel = DirectoryModel(
        id: map["id"] as int,
        name: map["name"] as String,
        created: DateTime.parse(map["created"] as String),
        updated: DateTime.parse(map["updated"] as String),
        desc: map["desc"] as String);

    return directoryModel;
  }

  @override
  Map<String, Object> toMap() {
    final map = <String, Object>{
      "id": id,
      "name": name,
      "created": created.toString(),
      "updated": updated.toString(),
      "desc": desc,
      "parentDirID": parentDirID
    };
    return map;
  }
}
