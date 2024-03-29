import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key, this.hint, this.onchanged, this.obsecure});
  final bool? obsecure;
  final String? hint;
  final Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure ?? false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is Required';
        }
      },
      onChanged: onchanged,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
