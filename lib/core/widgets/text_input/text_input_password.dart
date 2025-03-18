import 'package:flutter/material.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/core/widgets/text_input/text_input.dart';

class TextInputPassword extends StatefulWidget {
  const TextInputPassword(
      {super.key,
      this.label = "",
      this.controller,
      this.placeholder = "",
      this.obscureText = false,
      this.validator,
      this.keyboardType,
      this.prefixIcon,
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
  final TextEditingController? controller;

  @override
  State<StatefulWidget> createState() {
    return TextInputPasswordState();
  }
}

class TextInputPasswordState extends State<TextInputPassword> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: widget.controller,
      label: widget.label,
      placeholder: widget.placeholder,
      placeholderStyle: widget.placeholderStyle,
      obscureText: isSecure,
      validator: widget.validator,
      suffixIcon: IconButton(
        icon: const Icon(Icons.remove_red_eye),
        onPressed: () => setState(() {
          isSecure = !isSecure;
        }),
      ),
    );
  }
}
