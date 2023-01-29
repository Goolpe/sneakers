import 'package:flutter/material.dart';

class SneakerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SneakerAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.actions,
    this.subactions,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = false,
    this.height = 70,
  });

  final String? title;
  final String? subtitle;
  final List<Widget>? actions;
  final List<Widget>? subactions;
  final double elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool centerTitle;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  bool get _showFlexibleSpace => subtitle != null || subactions != null;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      foregroundColor: foregroundColor,
      leading: ModalRoute.of(context)?.impliesAppBarDismissal ?? false
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.topCenter,
              child: IconButton(
                icon: const Icon(Icons.keyboard_backspace),
                onPressed: () => Navigator.pop(context),
              ),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                    fontSize: 24,
                    color: foregroundColor,
                  ),
            )
          : null,
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor,
      actions: actions,
      flexibleSpace: _showFlexibleSpace
          ? SafeArea(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: subtitle != null
                          ? Text(
                              subtitle!,
                              style:
                                  Theme.of(context).appBarTheme.titleTextStyle,
                            )
                          : const SizedBox.shrink(),
                    ),
                    if (subactions != null) Row(children: subactions!),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
