import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/utils/text_styles.dart';

// TextIcon
class TextIcon extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final int spacing;
  final int? maxLine;
  final Function? onTap;
  final EdgeInsets? edgeInsets;
  final bool? expandedText;

  TextIcon({
    this.text,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.spacing = 4,
    this.maxLine,
    this.onTap,
    this.edgeInsets,
    this.expandedText,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildText() {
      return Text(text.validate(),
          style: textStyle ?? primaryTextStyle(),
          maxLines: maxLine,
          overflow: TextOverflow.ellipsis);
    }

    return Container(
      padding: edgeInsets ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          prefix != null ? Row(children: [prefix!, spacing.width]) : SizedBox(),
          expandedText.validate() ? buildText().expand() : buildText(),
          suffix != null ? Row(children: [spacing.width, suffix!]) : SizedBox(),
        ],
      ),
    ).onTap(onTap);
  }
}
