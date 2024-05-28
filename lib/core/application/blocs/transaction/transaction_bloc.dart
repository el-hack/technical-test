import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/transaction.dart';
import '../../../domain/repositories/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';


class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository repository;
  TransactionBloc(this.repository) : super(TransactionInitial()) {
    on<LoadTransactions>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    if (event is LoadTransactions) {
      yield TransactionLoading();
      try {
        final transactions = await repository.getTransactions();
        yield TransactionLoaded(transactions);
      } catch (_) {
        yield TransactionError();
      }
    }
  }
}
