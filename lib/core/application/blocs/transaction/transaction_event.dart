part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class OnInitializeTransaction extends TransactionEvent {
  const OnInitializeTransaction();
  @override
  List<Object> get props => [];
}

class LoadTransactions extends TransactionEvent {
  @override
  List<Object> get props => [];
}


class CreateTransactionEvent extends TransactionEvent {
  final Transaction transaction;
  const CreateTransactionEvent(this.transaction);

  @override
  List<Object> get props => [transaction];
}



class UpdateTransactionEvent extends TransactionEvent {
  final int id;
  final Transaction transaction;
  const UpdateTransactionEvent(this.id, this.transaction);
}

class DeleteTransactionEvent extends TransactionEvent {
  final int id;
  const DeleteTransactionEvent(this.id);
}
