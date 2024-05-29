import 'package:buimobile/core/domain/entities/transaction.dart';

import '../repositories/transaction_repository.dart';

class CreateTransaction{
  final TransactionRepository repository;

  CreateTransaction(this.repository);
  
  Future<Transaction> execute(Transaction transaction) async {
    return await repository.createTransaction(transaction);
  }
}