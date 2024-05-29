import 'package:buimobile/interface/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/text_field_custom.dart';

class RegisterUserNamePage extends StatelessWidget {
  const RegisterUserNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Acceuil'),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quel est votre nom complet?',
                style: Theme.of(context).textTheme.displayLarge),
            // const SizedBox(height: ),
            Text(
              "C'est ainsi que vous apparaîtrez publiquement aux autres",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.normal,
                  ),
              // textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            const TextFieldCustom(label: 'Nom complet'),
            const SizedBox(height: 10),
            ButtonCustom(
                label: 'Suivant',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  HomePage()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
