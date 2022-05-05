import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLeading;
  final List<Widget>? actions;
  final Widget? title;

  MainAppBar({this.title, this.isLeading = true, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: isLeading,
     
      elevation: 0,
      title: this.title,
      actions: actions,
      toolbarHeight: 50.h,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
