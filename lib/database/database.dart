import 'package:mongo_dart/mongo_dart.dart' show Db;
import 'dart:async';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  final String _host = "140.112.42.160";
  final String _port = "27017";
  final String _dbName = "Twitch";
  Db _db;

  Future<Db> get database async {
    if (_db == null) {
      try {
        _db = Db(_getConnectionString());
        await _db.open();
      } catch (e) {
        print(e);
      }
    }
    return _db;
  }

  _getConnectionString() {
    return "mongodb://$_host:$_port/$_dbName";
  }

  closeConnection() {
    _db.close();
  }
}
