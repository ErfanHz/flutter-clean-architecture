import 'package:clean_base/src/core/constants/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future initHive() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await Future.wait([
    Hive.openBox(HiveBoxNames.userInformation),
  ]);
}

class HiveManager {
  Box getBox(String boxName) {
    return Hive.box(boxName);
  }

  getBoxItem(String boxName, String boxKey) {
    final Box box = Hive.box(boxName);
    return box.get(boxKey);
  }

  putBoxItem(String boxName, String boxKey, dynamic value) {
    final Box box = Hive.box(boxName);
    box.put(boxKey, value);
  }

  clearBoxItem(String boxName, String boxKey) {
    putBoxItem(boxName, boxKey, null);
  }

  clearBox(String boxName) {
    final Box box = Hive.box(boxName);
    box.clear();
  }

}
