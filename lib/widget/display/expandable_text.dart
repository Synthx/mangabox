import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableText(
    this.text, {
    this.maxLines = 6,
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final textPainter = TextPainter(
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: widget.text,
          ),
        );
        textPainter.layout(maxWidth: size.maxWidth);

        return textPainter.didExceedMaxLines
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
                    maxLines: _expanded ? 100 : widget.maxLines,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(10),
                  TextButton.icon(
                    onPressed: () => _toggle(),
                    label: Icon(
                      _expanded ? Icons.expand_less : Icons.expand_more,
                      size: 17,
                    ),
                    icon: Text(_expanded ? 'Voir moins' : 'Voir plus'),
                  ),
                ],
              )
            : Text(widget.text);
      },
    );
  }
}
