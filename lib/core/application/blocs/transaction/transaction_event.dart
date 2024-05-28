part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class LoadTransactions extends TransactionEvent {
  final List<Transaction> transactions;
  const LoadTransactions({required this.transactions});

  @override
  List<Object> get props => [];
}


class CreateTransaction extends TransactionEvent {
  final Transaction transaction;
  CreateTransaction(this.transaction);
}

class UpdateTransaction extends TransactionEvent {
  final int id;
  final Transaction transaction;
  UpdateTransaction(this.id, this.transaction);
}

class DeleteTransaction extends TransactionEvent {
  final int id;
  DeleteTransaction(this.id);
}
