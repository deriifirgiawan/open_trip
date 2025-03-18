import 'package:flutter/material.dart';

class ChipBadge extends StatefulWidget {
  const ChipBadge(
      {super.key,
      required this.text,
      this.onPressed,
      this.backgroundColor,
      this.textColor = Colors.white,
      this.borderSide = BorderSide.none});

  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide? borderSide;
  final VoidCallback? onPressed;

  @override
  State<StatefulWidget> createState() {
    return ChipBadgeState();
  }
}

class ChipBadgeState extends State<ChipBadge> {
  @override
  Widget build(BuildContext context) {
    return RawChip(
        side: widget.borderSide,
        onPressed: widget.onPressed,
        backgroundColor: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide.none,
        ),
        label: Text(widget.text,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: widget.textColor)));
  }
}
