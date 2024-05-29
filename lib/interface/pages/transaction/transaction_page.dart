import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/color_constant.dart';
import '../../../core/application/blocs/transaction/transaction_bloc.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state is TransactionError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }

          if (state is TransactionCreated) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is TransactionInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TransactionLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          }
          if (state is TransactionLoaded) {
            return ListView.builder(
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(Icons.monetization_on,
                          color: ConstantColor.primary),
                    ),
                    title: Text(state.transactions[index].description,
                        style: Theme.of(context).textTheme.bodyLarge),
                    subtitle: Text('10:00 AM',
                        style: Theme.of(context).textTheme.bodyMedium),
                    trailing: Text('${state.transactions[index].amount} FCFA',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                );
              },
            );
          }
          return Container();
        },
      );
  }
}
