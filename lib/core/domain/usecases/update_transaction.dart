import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class UpdateTransaction {
  final TransactionRepository repository;

  UpdateTransaction(this.repository);

  Future<Transaction> execute(int id, Transaction transaction) async {
    return await repository.updateTransaction(id, transaction);
  }
}
