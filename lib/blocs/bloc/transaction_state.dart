part of 'transaction_bloc.dart';

@immutable
abstract class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object> get props => [];
}

class TransactionLoadInProgress extends TransactionState {}

class TransactionLoadSuccess extends TransactionState {
  final List<Transaction> transactions;

  const TransactionLoadSuccess([this.transactions = const []]);

  @override
  List<Object> get props => [transactions];

  @override
  String toString() => 'TransactionLoadSuccess { transactions: $transactions }';
}

class TransactionLoadFailure extends TransactionState {}
