import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FieldModelWidget extends StatelessWidget {
  // const FieldModelWidget({super.key});

  String hint;
  TextEditingController controller;
  bool isNumberKeyBoard;
  FieldModelWidget(
      {required this.hint,
      required this.controller,
      this.isNumberKeyBoard = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.4),
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
          contentPadding: EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
