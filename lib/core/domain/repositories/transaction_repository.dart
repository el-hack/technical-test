import '../entities/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactions();
  Future<Transaction> createTransaction(Transaction transaction);
  Future<Transaction> updateTransaction(int id, Transaction transaction);
  Future<void> deleteTransaction(int id);
}
 