// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'transaction.dart';
// import 'transaction_repository.dart';

// abstract class TransactionEvent {}

// class LoadTransactions extends TransactionEvent {}

// class CreateTransaction extends TransactionEvent {
//   final Transaction transaction;
//   CreateTransaction(this.transaction);
// }

// class UpdateTransaction extends TransactionEvent {
//   final int id;
//   final Transaction transaction;
//   UpdateTransaction(this.id, this.transaction);
// }

// class DeleteTransaction extends TransactionEvent {
//   final int id;
//   DeleteTransaction(this.id);
// }

// abstract class TransactionState {}

// class TransactionInitial extends TransactionState {}

// class TransactionLoading extends TransactionState {}

// class TransactionLoaded extends TransactionState {
//   final List<Transaction> transactions;
//   TransactionLoaded(this.transactions);
// }

// class TransactionError extends TransactionState {}

// class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
//   final TransactionRepository repository;

//   TransactionBloc(this.repository) : super(TransactionInitial());

//   @override
//   Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
//     if (event is LoadTransactions) {
//       yield TransactionLoading();
//       try {
//         final transactions = await repository.getTransactions();
//         yield TransactionLoaded(transactions);
//       } catch (_) {
//         yield TransactionError();
//       }
//     }
//     // Handle other events...
//   }
// }
