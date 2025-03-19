import 'package:flutter/material.dart';
import 'package:open_trip/core/widgets/select_input/select_input_state.dart';

class SelectInput extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextStyle placeholderStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onPressed;
  final String? value;

  const SelectInput(
      {super.key,
      this.label = "",
      this.placeholder = "",
      this.placeholderStyle = const TextStyle(color: Colors.grey),
      this.suffixIcon,
      this.prefixIcon,
      this.onPressed,
      this.value});

  @override
  SelectInputState createState() => SelectInputState();
}
