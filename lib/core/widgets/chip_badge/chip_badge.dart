import 'package:flutter/material.dart';

class ChipBadge extends StatefulWidget {
  const ChipBadge({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.borderSide = BorderSide.none,
  });

  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide? borderSide;
  final VoidCallback? onPressed;

  @override
  State<ChipBadge> createState() => _ChipBadgeState();
}

class _ChipBadgeState extends State<ChipBadge> {
  @override
  Widget build(BuildContext context) {
    return RawChip(
      key: ValueKey(widget.text),
      side: widget.borderSide,
      onPressed: () {
        if (widget.onPressed != null) {
          setState(() {});
          widget.onPressed!();
        }
      },
      backgroundColor: widget.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      label: Text(
        widget.text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: widget.textColor,
        ),
      ),
    );
  }
}
