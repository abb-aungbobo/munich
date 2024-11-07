import 'package:munich/data/database/config.dart';
import 'package:realm/realm.dart';

class DatabaseClient {
  final _realm = Realm(config);

  Iterable<T> getAll<T extends RealmObject>() {
    return _realm.all<T>();
  }

  Future<T> add<T extends RealmObject>(T item) {
    return _realm.writeAsync(() => _realm.add(item));
  }

  Future<void> addList<T extends RealmObject>(Iterable<T> items) async {
    await _realm.writeAsync(() => _realm.addAll<T>(items));
  }

  Future<void> update<T extends RealmObject>(Function() writeCallback) {
    return _realm.writeAsync(writeCallback);
  }

  Future<void> delete<T extends RealmObject>(T item) async {
    await _realm.writeAsync(() => _realm.delete(item));
  }

  T? find<T extends RealmObject>(Object primaryKey) {
    return _realm.find<T>(primaryKey);
  }

  void dispose() {
    _realm.close();
  }
}
