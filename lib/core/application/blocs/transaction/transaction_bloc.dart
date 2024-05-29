import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:buimobile/core/domain/usecases/create_transaction.dart';
import 'package:buimobile/core/domain/usecases/delete_transaction.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/usecases/get_transaction.dart';
import '../../../domain/usecases/update_transaction.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactions getTransactions;
  final UpdateTransaction updateTransaction;
  final CreateTransaction createTransaction;
  final DeleteTransaction deleteTransaction;

  TransactionBloc(
      {required this.getTransactions,
      required this.updateTransaction,
      required this.createTransaction, 
      required this.deleteTransaction})
      : super(const TransactionInitial()) {
    on<OnInitializeTransaction>((event, emit) async {
      emit(TransactionLoading());
      try {
        // log('message');
        final transactions = await getTransactions.execute();
        print(transactions.toString());
        emit(TransactionLoaded(transactions));
      } catch (e) {
        emit(TransactionError(e.toString()));
      }
    });

    on<CreateTransactionEvent>((event, emit) async {
      emit(TransactionCreatedLoading());
      try {
        await createTransaction.execute(event.transaction);
        final transactions = await getTransactions.execute();
        emit(const TransactionCreatedFinished("Transaction creé avec succes"));
        emit(TransactionLoaded(transactions));
      } catch (e) {
        emit(TransactionError(e.toString()));
      }
    });

    on<UpdateTransactionEvent>((event, emit) async {
      emit(TransactionCreatedLoading());
      try {
        await updateTransaction.execute(event.id, event.transaction);
        final transactions = await getTransactions.execute();
        emit(const TransactionCreatedFinished(
            "Transaction modifié avec succes"));
        emit(TransactionLoaded(transactions));
      } catch (e) {
        emit(TransactionError(e.toString()));
      }
    });

    on<DeleteTransactionEvent>((event, emit) async {
      emit(TransactionCreatedLoading());
      try {
        await deleteTransaction.execute(event.id);
        final transactions = await getTransactions.execute();
        emit(const TransactionDeletedFinished(
            "Transaction supprimé avec succes"));
        emit(TransactionLoaded(transactions));
      } catch (e) {
        emit(TransactionError(e.toString()));
      }
    });
  }
}
