import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Widget? leading;
  final TextStyle? titleStyle;
  final bool? centerTitle;

  const CustomAppbar(
      {super.key,
      required this.title,
      required this.automaticallyImplyLeading,
      required this.actions,
      this.leading,
      this.titleStyle,
      this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(title, style: titleStyle ?? Theme.of(context).textTheme.displaySmall, overflow: TextOverflow.ellipsis, softWrap: false),
      centerTitle: centerTitle ?? true,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
