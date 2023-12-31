import 'package:flutter/material.dart';

class WHighlightedTextField extends StatelessWidget {
  final String allText;
  final String highlightedText;
  final Color highlightColor;
  final TextStyle? textStyle;
  final TextStyle? highlightedTextStyle;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  const WHighlightedTextField({
    required this.allText,
    required this.highlightedText,
    required this.highlightColor,
    this.textStyle,
    this.highlightedTextStyle,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (highlightedText.isNotEmpty) {
      return RichText(
        text: TextSpan(
          text: allText.split(highlightedText)[0],
          style: textStyle,
          children: [
            if (allText.split(highlightedText).length > 1) ...{
              WidgetSpan(
                child: Container(
                  decoration: BoxDecoration(
                    color: highlightColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    highlightedText,
                    style: highlightedTextStyle,
                    maxLines: maxLines,
                    textAlign: textAlign,
                    overflow: textOverflow,
                  ),
                ),
              ),
              ...getOtherText()
            }
          ],
        ),
        textAlign: TextAlign.start,
      );
    } else {
      return Text(
        allText,
        style: textStyle,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: textOverflow,
      );
    }
  }

  List<InlineSpan> getOtherText() {
    final list = [];
    for (final currentText in allText.split(highlightedText).skip(1).toList()) {
      list.add(
        WidgetSpan(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              currentText,
              style: textStyle,
            ),
          ),
        ),
      );
      if (list.length >= 2) {
        list.insert(
          1,
          WidgetSpan(
            child: Container(
              decoration: BoxDecoration(
                color: highlightColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                highlightedText,
                style: highlightedTextStyle,
                maxLines: maxLines,
                textAlign: textAlign,
                overflow: textOverflow,
              ),
            ),
          ),
        );
      }
    }
    return list.cast<InlineSpan>();
  }
}
