import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainElevatedButton extends StatelessWidget {
  late final VoidCallback? onPressed;
  late final Widget? child;

  MainElevatedButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0.h),
      width: double.infinity,
      height: 50.0.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class MainElevatedButtonIcon extends StatelessWidget {
  late final VoidCallback? onPressed;
  late final Widget label;
  late final Widget icon;

  MainElevatedButtonIcon(
      {required this.onPressed, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0.h),
      width: double.infinity,
      height: 50.0.h,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: label,
        icon: icon,
      ),
    );
  }
}

class MainTextButton extends StatelessWidget {
  late final VoidCallback? onPressed;
  late final Widget child;

  MainTextButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0.h),
      width: double.infinity,
      height: 50.0.h,
      child: TextButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}