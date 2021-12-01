import 'package:flutter/material.dart';
import 'package:moor_db_viewer/src/style/theme_dimens.dart';
import 'package:moor_db_viewer/src/widget/filter/selectable_action.dart';

class LimitWidget extends StatelessWidget {
  final int limit;

  const LimitWidget({
    required this.limit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeDimens.padding16,
            vertical: ThemeDimens.padding8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LIMIT',
                style: theme.textTheme.bodyText1,
              ),
              Center(
                child: SelectableAction(
                  selected: true,
                  text: limit.toString(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
