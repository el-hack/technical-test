part of 'transaction_bloc.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();
  
  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {
  const TransactionInitial();
}

final class TransactionLoading extends TransactionState {}

final class TransactionCreatedLoading extends TransactionState {}

final class TransactionUpdatedLoading extends TransactionState {}

final class TransactionCreatedFinished extends TransactionState {
  final String message;

  const TransactionCreatedFinished(this.message);

  @override
  @override
  List<Object> get props => [message];
}

final class TransactionDeletedFinished extends TransactionState {
  final String message;

  const TransactionDeletedFinished(this.message);

  @override
  @override
  List<Object> get props => [message];
}

final class TransactionUpdated extends TransactionState {
  final Transaction transaction;

  const TransactionUpdated(this.transaction);

  @override
  @override
  List<Object> get props => [transaction];
}

final class TransactionLoaded extends TransactionState {
  final List<Transaction> transactions; 

  const TransactionLoaded(this.transactions);
}

final class TransactionCreated extends TransactionState {
  final Transaction transaction;

  const TransactionCreated(this.transaction);

  @override
  @override
  List<Object> get props => [transaction];
}

final class TransactionError extends TransactionState {
  final String message;

  const TransactionError(this.message);
}

