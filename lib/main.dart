import 'package:buimobile/core/domain/usecases/delete_transaction.dart';
import 'package:buimobile/core/domain/usecases/get_transaction.dart';
import 'package:buimobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/application/blocs/transaction/transaction_bloc.dart';
import 'core/domain/usecases/create_transaction.dart';
import 'core/domain/usecases/update_transaction.dart';
import 'interface/pages/auth_page.dart';
import 'package:buimobile/core/application/service_locator.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionBloc>(
            lazy: false,
            create: (context) => TransactionBloc(
                  deleteTransaction: di.sl<DeleteTransaction>(),
                  createTransaction: di.sl<CreateTransaction>(),
                  getTransactions: di.sl<GetTransactions>(),
                  updateTransaction: di.sl<UpdateTransaction>(),
                )..add(OnInitializeTransaction()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: const AuthPage(),
      ),
    );
  }
}
