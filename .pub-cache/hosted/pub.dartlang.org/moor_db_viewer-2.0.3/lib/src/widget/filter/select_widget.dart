import 'package:flutter/material.dart';
import 'package:moor_db_viewer/src/style/theme_dimens.dart';
import 'package:moor_db_viewer/src/widget/filter/selectable_action.dart';

class SelectWidget extends StatelessWidget {
  final bool areAllColumnsSelected;
  final Map<String, bool> columns;
  final VoidCallback onSelectAll;
  final ValueChanged<String> onToggleColumn;

  const SelectWidget({
    @required this.areAllColumnsSelected,
    @required this.columns,
    @required this.onSelectAll,
    @required this.onToggleColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeDimens.padding16,
            vertical: ThemeDimens.padding8,
          ),
          child: Text('SELECT'),
        ),
        Wrap(
          children: [
            SelectableAction(
              selected: areAllColumnsSelected,
              text: '*',
              onClick: onSelectAll,
            ),
            for (var i = 0; i < columns.keys.length; ++i)
              SelectableAction(
                selected: columns.values.toList()[i],
                text: columns.keys.toList()[i],
                onClick: () => onToggleColumn(columns.keys.toList()[i]),
              ),
          ],
        ),
      ],
    );
  }
}
