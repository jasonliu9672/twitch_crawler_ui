import 'package:twitch_crawler_ui/database/database.dart';
import 'package:twitch_crawler_ui/models/transaction.dart';
import 'package:mongo_dart/mongo_dart.dart' show where;

class TransactionRepository {
  final dbProvider = DatabaseProvider.dbProvider;
  Future<List<Transaction>> getTransactionsByCountry(
    String country, {
    String channel,
  }) async {
    final db = await dbProvider.database;
    final collection = db.collection(country);
    List<Map<String, dynamic>> result;
    if (country != null) {
      result = await collection.find(where.eq("channel", channel)).toList();
    } else {
      result = await collection.find().toList();
    }
    List<Transaction> transactions = result.isNotEmpty
        ? result.map((item) => Transaction.fromDatabaseJson(item)).toList()
        : [];
    return transactions;
  }

  Future<List<String>> getCollectionNames() async {
    final db = await dbProvider.database;
    final collectionNames = db.getCollectionNames();
    return collectionNames;
  }
}
