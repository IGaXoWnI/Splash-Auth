// ignore_for_file: prefer_const_constructors, empty_statements

import 'package:flutter/material.dart';

class Textf extends StatelessWidget {
  final String hint;
  final String path;
  final bool ispasssword;
  final String? Function(String?)? validator;
  final String? Function(String?)? onsave;

  const Textf({
    Key? key,
    required this.hint,
    required this.path,
    required this.ispasssword,
    required this.validator,
    required this.onsave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, right: 35, left: 35),
        child: TextFormField(
          onSaved: onsave,
          validator: validator,
          obscureText: ispasssword,
          decoration: InputDecoration(
            prefixIcon: ImageIcon(
              AssetImage(path),
              color: Colors.amber[900],
            ),
            hintText: hint,
            border: InputBorder.none,
          ),
        ));
  }
}
