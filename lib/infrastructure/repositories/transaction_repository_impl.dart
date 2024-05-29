import 'package:buimobile/core/domain/repositories/transaction_repository.dart';

import '../../core/domain/entities/transaction.dart';
import '../data_sources/remote_data_source.dart';

class TransactionRepositoryImpl implements TransactionRepository{
  final RemoteDataSource remoteDataSource;

  TransactionRepositoryImpl({required this.remoteDataSource});


  @override
  Future<List<Transaction>> getTransactions() {
    return remoteDataSource.getTransactions();
  }

  @override
  Future<Transaction> updateTransaction(int id, Transaction transaction) {
    return remoteDataSource.updateTransaction(id,transaction);
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) {
    return remoteDataSource.createTransaction(transaction);
  }

  @override
  Future<void> deleteTransaction(int id) {
    return remoteDataSource.deleteTransaction(id);
  }
}