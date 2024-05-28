import 'package:buimobile/interface/pages/register_user/register_user_name_page.dart';
import 'package:buimobile/interface/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              height: 100,
            ),
            Text('Connexion ou Inscription',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            const TextFieldCustom(label: 'Email'),
            const SizedBox(height: 10),
            // const TextFieldCustom(label: 'Email'),
            ButtonCustom(
                label: 'Connexion',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const RegisterUserNamePage()),
                  );
                }),
            const SizedBox(height: 10),
            const Text('or')
          ],
        ),
      ),
    );
  }
}
