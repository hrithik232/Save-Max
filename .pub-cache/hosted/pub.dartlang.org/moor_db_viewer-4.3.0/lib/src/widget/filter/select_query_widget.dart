import 'package:flutter/material.dart';
import 'package:moor_db_viewer/src/style/theme_colors.dart';
import 'package:moor_db_viewer/src/style/theme_dimens.dart';

class SelectQueryWidget extends StatelessWidget {
  final String query;
  final VoidCallback onEditClicked;

  const SelectQueryWidget({
    required this.query,
    required this.onEditClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onEditClicked,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: theme.dialogBackgroundColor,
            padding: EdgeInsets.all(ThemeDimens.padding16),
            child: Text(
              query,
              style: theme.textTheme.bodyText1,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Icon(
              Icons.edit,
              size: ThemeDimens.padding16,
              color: theme.textTheme.bodyText1?.color,
            ),
          ),
        ],
      ),
    );
  }
}
