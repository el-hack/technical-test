import 'package:buimobile/constant/color_constant.dart';
import 'package:buimobile/core/application/blocs/transaction/transaction_bloc.dart';
import 'package:buimobile/interface/widgets/text_field_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset('assets/images/logo.svg'),
        backgroundColor: Colors.transparent,
        actions: const [CircleAvatar(), SizedBox(width: 10)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    decoration: BoxDecoration(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Ajouter une transaction',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 22),
                        const TextFieldCustom(label: 'Titre'),
                        const SizedBox(height: 10),
                        const TextFieldCustom(label: 'Montant'),
                        const SizedBox(height: 10),
                        ButtonCustom(
                          label: 'Ajouter',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ));
        },
        child: const Icon(Icons.add),
      ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => TransactionBloc()),
          ],
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Transactions',
                        style: Theme.of(context).textTheme.displayLarge),
                    const Spacer(),
                    Text('Voir tout',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.normal,
                                )),
                  ],
                ),
                const SizedBox(height: 22),
                Expanded(
                  child: ListView(
                    children: [
                      Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: const Icon(Icons.monetization_on,
                                color: ConstantColor.primary),
                          ),
                          title: Text('Paiement de facture',
                              style: Theme.of(context).textTheme.bodyLarge),
                          subtitle: Text('10:00 AM',
                              style: Theme.of(context).textTheme.bodyMedium),
                          trailing: Text('10.000 FCFA',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
