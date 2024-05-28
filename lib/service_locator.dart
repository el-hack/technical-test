// import 'package:buimobile/constant/string_constant.dart';
// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';
// import 'core/domain/repositories/transaction_repository.dart';
// import 'transaction_repository_impl.dart';
// import 'transaction_bloc.dart';

// final getIt = GetIt.instance;

// void setupLocator() {
//   // Enregistrer les services
//   getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
//         baseUrl: ConstantString.baseUrl,
//         connectTimeout:const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 10),
//       )));

//   // Enregistrer les repositories
//   getIt.registerLazySingleton<TransactionRepository>(
//       () => TransactionRepositoryImpl(getIt<Dio>()));

//   // Enregistrer les BLoCs
//   getIt.registerFactory(() => TransactionBloc(getIt<TransactionRepository>()));
// }
