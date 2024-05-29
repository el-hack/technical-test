import 'package:buimobile/core/application/blocs/transaction/transaction_bloc.dart';
import 'package:buimobile/infrastructure/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../infrastructure/data_sources/remote_data_source.dart';
import '../../infrastructure/repositories/transaction_repository_impl.dart';
import '../domain/repositories/transaction_repository.dart';
import '../domain/usecases/create_transaction.dart';
import '../domain/usecases/delete_transaction.dart';
import '../domain/usecases/get_transaction.dart';
import '../domain/usecases/update_transaction.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<Dio>(() => DioClient.create());

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: sl<Dio>()),
  );

  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(remoteDataSource: sl<RemoteDataSource>()),
  );

  sl.registerLazySingleton<GetTransactions>(
    () => GetTransactions(sl<TransactionRepository>()),
  );

  sl.registerLazySingleton<UpdateTransaction>(
    () => UpdateTransaction(sl<TransactionRepository>()),
  );

  sl.registerLazySingleton<CreateTransaction>(
      () => CreateTransaction(sl<TransactionRepository>()));

  sl.registerFactory<DeleteTransaction>(() => DeleteTransaction(sl<TransactionRepository>()));
}
