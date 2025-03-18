import 'package:flutter/material.dart';

enum ButtonType { filled, ghost }

class Button extends StatefulWidget {
  const Button(
      {super.key,
      this.text = "",
      this.type = ButtonType.filled,
      required this.onPressed});

  final String text;
  final ButtonType type;
  final VoidCallback? onPressed;

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    if (widget.type == ButtonType.filled) {
      return _filled(context);
    }

    if (widget.type == ButtonType.ghost) {
      return _ghost();
    }

    return const SizedBox.shrink();
  }

  Widget _filled(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              // Change your radius here
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  Widget _ghost() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              // Change your radius here
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
