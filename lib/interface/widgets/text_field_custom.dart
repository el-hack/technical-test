import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String label;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final bool? enableInteractiveSelection;
  final bool? autofocus;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  const TextFieldCustom({
    super.key,
    required this.label,
    this.obscureText,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmitted,
    this.enableInteractiveSelection,
    this.autofocus,
    this.decoration,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      // cursorHeight: 50,
      cursorWidth: 1,
      cursorRadius: const Radius.circular(10),
      onChanged: (value) {},
      onSubmitted: (value) {},
      obscureText: false,
      enableInteractiveSelection: true,
      autofocus: false,
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        // label: const Text('Email'),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        hintStyle: const TextStyle(color: Colors.grey),
        // prefixIcon: ,
        fillColor: const Color(0XFFE0E0E0),
        filled: true,
      ),
    );
  }
}
