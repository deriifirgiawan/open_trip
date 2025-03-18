import 'package:flutter/material.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/core/widgets/text_input/text_input_state.dart';
import 'package:open_trip/core/widgets/text_input/text_input_type.dart';

class TextInput extends StatefulWidget {
  const TextInput(
      {super.key,
      this.label = "",
      this.maxLength,
      this.controller,
      this.placeholder = "",
      this.obscureText = false,
      this.textInputType = TypeTextInput.input,
      this.validator,
      this.keyboardType,
      this.prefixIcon,
      this.selectInputValue,
      this.suffixIcon,
      this.borderRadius = const BorderRadius.all(Radius.circular(12)),
      this.placeholderStyle = const TextStyle(
          color: ColorPalette.textDisable, fontWeight: FontWeight.bold)});
  final String? label;
  final String placeholder;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderRadius borderRadius;
  final TextStyle? placeholderStyle;
  final int? maxLength;
  final TextEditingController? controller;
  final TypeTextInput? textInputType;
  final String? selectInputValue;

  @override
  State<StatefulWidget> createState() {
    return TextInputState();
  }
}
