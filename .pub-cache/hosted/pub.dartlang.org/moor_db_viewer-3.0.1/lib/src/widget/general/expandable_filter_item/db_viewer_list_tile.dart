import 'package:flutter/material.dart';
import 'package:moor_db_viewer/src/style/theme_dimens.dart';

class DbViewerListTile extends StatelessWidget {
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback onClick;

  const DbViewerListTile({
    required this.child,
    required this.onClick,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                Container(width: ThemeDimens.padding32),
              ],
              Expanded(child: child),
              if (trailing != null) ...[
                Container(width: ThemeDimens.padding16),
                trailing!,
              ],
            ],
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}
