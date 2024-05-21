import 'package:flutter/material.dart';

const appBottomLineColor = Color(0xFFe8e8e8);
const shadowColor = Color(0x73242629);

class LimpAppBar extends AppBar {
  LimpAppBar(
      {super.key,
      super.leading,
      super.leadingWidth,
      super.title,
      super.centerTitle,
      super.actions,
      super.backgroundColor,
      Color? bottomDividerLineColor})
      : super(
            bottom: LimpDivider(
                color: bottomDividerLineColor ?? appBottomLineColor));
}

class LimpDivider extends StatelessWidget implements PreferredSizeWidget {
  final double? indent, endIndent;
  final Color color;
  const LimpDivider({
    super.key,
    this.indent,
    this.endIndent,
    this.color = appBottomLineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: indent ?? 0, right: endIndent ?? 0),
      decoration: BoxDecoration(color: color),
      height: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(1);
}
