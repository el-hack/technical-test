import 'package:buimobile/core/domain/repositories/transaction_repository.dart';
import 'package:dio/dio.dart';

import '../../core/domain/entities/transaction.dart';

class TransactionRepositoryImpl implements TransactionRepository{
  final Dio dio;

  TransactionRepositoryImpl(this.dio);

  @override
  Future<List<Transaction>> getTransactions() async {
    final response = await dio.get('/transactions');
    return (response.data as List)
        .map((json) => Transaction.fromJson(json))
        .toList();
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    final response =
        await dio.post('/transactions', data: transaction.toJson());
    return Transaction.fromJson(response.data);
  }

  @override
  Future<Transaction> updateTransaction(int id, Transaction transaction) async {
    final response =
        await dio.put('/transactions/$id', data: transaction.toJson());
    return Transaction.fromJson(response.data);
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await dio.delete('/transactions/$id');
  }
}