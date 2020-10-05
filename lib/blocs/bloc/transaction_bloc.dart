import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:twitch_crawler_ui/models/transaction.dart';
import 'package:twitch_crawler_ui/respository/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _transactionRepository;
  TransactionBloc({@required TransactionRepository transactionRepository})
      : assert(transactionRepository != null),
        _transactionRepository = transactionRepository,
        super(TransactionLoadInProgress());

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    
  }

// Stream<TransactionState> _mapLoadTransactionLoadedToState() async* {
//    try {
//       final transactions = await this._transactionRepository.getTransactionsByCountry();
//       yield TransactionLoadSuccess(
//         transactions.map(Transaction.fromDatabaseJson).toList(),
//       );
//     } catch (_) {
//       yield TodosLoadFailure();
//     }
// }