import "package:flutter/material.dart";
import "package:playground_bloc/shared/styles/color_style.dart";

class AppBarMenu extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMenu({
    super.key,
    required this.title,
    this.isNoConnection,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.bottom,
    this.centerTitle = true,
    this.onBackPressed,
    this.isBackEnable,
  });

  final String title;
  final bool? isNoConnection;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final bool centerTitle;
  final VoidCallback? onBackPressed;
  final bool? isBackEnable;

  @override
  Widget build(BuildContext context) {
    final canPop =
        ModalRoute.of(context)?.canPop ?? Navigator.of(context).canPop();

    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 4.0,
      centerTitle: centerTitle,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 14,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading:
          (canPop)
              ? IconButton(
                iconSize: 14,
                onPressed:
                    isBackEnable == null
                        ? ((onBackPressed != null)
                            ? onBackPressed
                            : () => Navigator.pop(context))
                        : null,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color:
                      isBackEnable == null ? Colors.white : Colors.transparent,
                ),
              )
              : null,
      actions: actions,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [ColorStyle.primary, ColorStyle.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
