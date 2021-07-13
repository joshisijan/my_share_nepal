import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_share_nepal/helper/constants.dart';

class CustomFormField extends StatelessWidget {
  final String? hint;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  CustomFormField({
    this.hint,
    this.keyboardType,
    this.textInputFormatter,
    this.textEditingController,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: Theme.of(context).primaryColorLight,
      keyboardType: keyboardType,
      inputFormatters: textInputFormatter,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: 0.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(100),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).errorColor.withAlpha(120),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(100),
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
      ),
    );
  }
}
