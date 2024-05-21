import 'package:flutter/material.dart';

class MText extends StatefulWidget {
   MText({super.key, this.text, this.style, this.children,
   this.maxLines, this.overflow});
  String? text;
  List<InlineSpan>? children;
  TextStyle? style;
  int? maxLines;
  TextOverflow? overflow;

  @override
  State<MText> createState() => _MTextState();
}

class _MTextState extends State<MText> {
  @override
  Widget build(BuildContext context) {
    return  Text.rich(TextSpan(
      text: widget.text,
      style: widget.style,
      children: widget.children
    ), maxLines: widget.maxLines,
    overflow: widget.overflow);
  }
}
