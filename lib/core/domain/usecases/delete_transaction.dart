import '../repositories/transaction_repository.dart';

class DeleteTransaction{
  final TransactionRepository repository;
  DeleteTransaction(this.repository);
  Future<void> execute(int id) async {
    return await repository.deleteTransaction(id);
  }
}