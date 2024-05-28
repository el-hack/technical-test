import 'package:buimobile/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override 
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) { 
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => const AuthPage()),
    //   );
    // });
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: ConstantColor.primary,
        child: Center(
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            height: 200,
            colorFilter: const ColorFilter.mode(Colors. white, BlendMode.srcIn),
          ).animate().fade(duration: 500.ms).scale(duration: 500.ms),
        ),
      ),
    ));
  }
}
