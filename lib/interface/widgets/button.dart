import 'package:flutter/material.dart';

import '../../constant/color_constant.dart';

class ButtonCustom extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const ButtonCustom({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ConstantColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            textStyle: Theme.of(context).textTheme.titleMedium,
            padding: const EdgeInsets.symmetric(vertical: 15)),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
