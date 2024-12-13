import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Widget? leading;
  final Color? backgroundColor;
  final bool hideback;
  final double? height;
  final Color containerColor;

  const BasicAppBar({
    super.key,
    this.title,
    this.action,
    this.backgroundColor,
    required this.hideback,
    this.height,
    this.leading, required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80,
      title: title ?? const Text(''),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: leading ??
          (hideback
              ? null
              : IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: containerColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 15.sp,
                      color: const Color(0xff242A32),
                    ),
                  ),
                )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
