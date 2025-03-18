import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/core/widgets/text_input/text_input.dart';
import 'package:open_trip/core/widgets/text_input/text_input_type.dart';

class TextInputState extends State<TextInput> {
  Widget _buildSelectInput(BuildContext context) {
    String? renderText() {
      if (widget.selectInputValue!.isNotEmpty) {
        return widget.selectInputValue;
      }

      return widget.placeholder;
    }

    TextStyle? renderTextStyle() {
      if (widget.selectInputValue!.isNotEmpty) {
        return TextStyle(color: ColorPalette.textDisable);
      }

      return widget.placeholderStyle;
    }

    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != "")
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                widget.label ?? "",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                if (widget.prefixIcon != null) widget.prefixIcon!,
                Expanded(
                  child: Text(
                    renderText() ?? "",
                    style: renderTextStyle(),
                  ),
                ),
                if (widget.suffixIcon != null) widget.suffixIcon!,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextInput(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != ""
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.label ?? "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : const SizedBox(),
        TextFormField(
          controller: widget.controller,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          obscureText: widget.obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              hintText: widget.placeholder,
              hintStyle: widget.placeholderStyle,
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorPalette.textDisable, width: 1),
                  borderRadius: widget.borderRadius),

              // enable border
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorPalette.textDisable, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              errorStyle: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
              contentPadding: const EdgeInsets.only(
                  bottom: 14, top: 14, right: 16, left: 16)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.textInputType == TypeTextInput.input
        ? _buildTextInput(context)
        : _buildSelectInput(context);
  }
}
