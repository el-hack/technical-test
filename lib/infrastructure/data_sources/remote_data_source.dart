import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/domain/entities/transaction.dart';

abstract class RemoteDataSource {
  Future<List<Transaction>> getTransactions();
  Future<Transaction> updateTransaction(int id, Transaction transaction);
  Future<Transaction> createTransaction(Transaction transaction);
  Future<void> deleteTransaction(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio client;

  RemoteDataSourceImpl({required this.client});
  @override
  Future<List<Transaction>> getTransactions() {
    return client
        .get('/transactions/all')
        .then((value) =>
            (value.data as List).map((e) => Transaction.fromJson(e)).toList())
        .catchError((onError) {
      log(onError.toString());
      return onError;
    });
  }

  @override
  Future<Transaction> updateTransaction(int id, Transaction transaction) {
    return client
        .patch('/transactions/update/$id', data: transaction.toJson())
        .then((value) => transaction);
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) {
    inspect(transaction);
    return client
        .post('/transactions/create', data: transaction.toJson())
        .then((value) {
      log(value.toString());

      return transaction;
    }).catchError((onError) {
      log(onError.toString());
      return onError;
    });
  }

  @override
  Future<void> deleteTransaction(int id) {
    return client
        .delete('/transactions/delete/$id')
        .then((value) => value)
        .catchError((onError) {
          log(onError.toString());
          return onError;
        });
  }
}
