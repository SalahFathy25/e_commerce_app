import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() => _instance;

  LocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<S>(String key, S value) async {
    await _storage.write(key, value);
  }

  S? readData<S>(String key) {
    return _storage.read(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
