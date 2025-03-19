import 'package:flutter/material.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/core/widgets/select_input/select_input.dart';

class SelectInputState extends State<SelectInput> {
  @override
  Widget build(BuildContext context) {
    String? renderText() {
      if (widget.value!.isNotEmpty) {
        return widget.value;
      }
      return widget.placeholder;
    }

    TextStyle renderStyleText() {
      if (widget.value!.isNotEmpty) {
        return TextStyle(color: ColorPalette.textDisable);
      }
      return widget.placeholderStyle;
    }

    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800,
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
                    style: renderStyleText(),
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
