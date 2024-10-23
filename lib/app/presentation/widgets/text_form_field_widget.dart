import 'package:flutter/material.dart';

import '../helpers/form_helper.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? ec;
  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.keyboardType,
    this.validator,
    this.onChanged,
    this.ec,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ec,
      onTapOutside: (_) => unfocus(context),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white, 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), 
          borderSide: const BorderSide(
            color: Colors.grey, 
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.green, 
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.red, 
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
