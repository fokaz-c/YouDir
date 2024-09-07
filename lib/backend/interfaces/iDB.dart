import 'package:youdir/models/directoryModel.dart';

abstract class IDB {
  Future<void> addDir({required String name, String desc = ""});
  Future<DirectoryModel> getDir({required int id});
  Future<List<DirectoryModel>>getDirs({int parentDirID = -1});
}
