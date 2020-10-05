import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final String channel;
  final String start;
  final String end;
  final Map transactionList;
  final List<String> serverPool;

  Transaction({
    this.id,
    this.channel,
    this.start,
    this.end,
    this.transactionList,
    this.serverPool,
  });
  @override
  List<Object> get props =>
      [id, channel, start, end, transactionList, serverPool];

  factory Transaction.fromDatabaseJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      channel: json['channel'],
      start: json['start'],
      end: json['end'],
      transactionList: json['transactionList'],
      serverPool: json['serverPool'],
    );
  }
}
