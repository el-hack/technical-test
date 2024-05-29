import 'package:buimobile/constant/color_constant.dart';
import 'package:buimobile/core/application/blocs/transaction/transaction_bloc.dart';
import 'package:buimobile/core/application/service_locator.dart';
import 'package:buimobile/core/domain/entities/transaction.dart';
import 'package:buimobile/core/domain/usecases/create_transaction.dart';
import 'package:buimobile/core/domain/usecases/get_transaction.dart';
import 'package:buimobile/interface/pages/transaction/transaction_page.dart';
import 'package:buimobile/interface/widgets/text_field_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/domain/usecases/update_transaction.dart';
import '../widgets/button.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _statusController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionBloc = context.watch<TransactionBloc>();
    return Scaffold(
        appBar: AppBar(
          leading: SvgPicture.asset('assets/images/logo.svg'),
          backgroundColor: Colors.transparent,
          actions: const [CircleAvatar(), SizedBox(width: 10)],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ShowBottonSheetCreateEditTransaction(context: context);
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Transactions',
                      style: Theme.of(context).textTheme.displayLarge),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => const TransactionPage()),
                        // );
                      },
                      child: Text('Voir tout',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.normal,
                                  ))),
                ],
              ),
              Expanded(
                  child: BlocConsumer<TransactionBloc, TransactionState>(
                listener: (context, state) {
                  if (state is TransactionError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                    ));
                  }
                  if (state is TransactionCreatedFinished) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                    ));
                  }

                  if (state is TransactionCreated) {
                    Navigator.of(context).pop();
                  }
                  if (state is TransactionDeletedFinished) {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                    ));
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
                    if (state.transactions.isEmpty) {
                      return Center(
                          child: Text('Aucune transaction',
                              style: Theme.of(context).textTheme.titleLarge));
                    }
                    return ListView.builder(
                      itemCount: state.transactions.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            BlocProvider.of<TransactionBloc>(context).add(
                                  DeleteTransactionEvent(state.transactions[index].id!));
                          }, 
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete),
                          ),
                          direction: DismissDirection.endToStart,
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                ShowBottonSheetCreateEditTransaction(
                                    context: context,
                                    data: state.transactions[index]);
                              },
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey.shade300,
                                child: const Icon(Icons.monetization_on,
                                    color: ConstantColor.primary),
                              ),
                              title: Text(state.transactions[index].description,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              subtitle: Text('10:00 AM',
                                  style: Theme.of(context).textTheme.bodyMedium),
                              trailing: Text(
                                  '${state.transactions[index].amount} FCFA',
                                  style: Theme.of(context).textTheme.bodyMedium),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ))
            ],
          ),
        ));
  }

  Future<dynamic> ShowBottonSheetCreateEditTransaction(
      {required BuildContext context, Transaction? data}) {
    _titleController.text = data?.description ?? '';
    _amountController.text = data?.amount.toString() ?? '';
    _statusController.text = data?.status ?? '';
    _typeController.text = data?.type ?? '';

    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        '${data != null ? 'Modifier' : 'Ajouter'} une transaction',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 22),
                    TextFieldCustom(
                        label: 'Titre', controller: _titleController),
                    const SizedBox(height: 10),
                    TextFieldCustom(
                        label: 'Montant', controller: _amountController),
                    const SizedBox(height: 10),
                    TextFieldCustom(
                        label: 'Statut', controller: _statusController),
                    const SizedBox(height: 10),
                    TextFieldCustom(label: 'Type', controller: _typeController),
                    const SizedBox(height: 10),
                    BlocBuilder<TransactionBloc, TransactionState>(
                      builder: (context, state) {
                        return ButtonCustom(
                          label: state is TransactionCreatedLoading
                              ? 'Chargement...'
                              : data == null
                                  ? 'Ajouter'
                                  : 'Enregistrer',
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return const SnackBar(
                                  content:
                                      Text('Veuillez remplir tous les champs'));
                            }
                            final transaction = Transaction(
                                description: _titleController.text,
                                status: _statusController.text,
                                type: _typeController.text,
                                amount: int.parse(_amountController.text));
                            if (data != null) {
                              BlocProvider.of<TransactionBloc>(context).add(
                                  UpdateTransactionEvent(
                                      data.id!, transaction));
                            } else {
                              BlocProvider.of<TransactionBloc>(context)
                                  .add(CreateTransactionEvent(transaction));
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ));
  }
}
