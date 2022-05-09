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

class MainDateTimePicker extends StatelessWidget {
  late final String buttonText;
  late final IconData? icons;
  late final VoidCallback onSelected;
  late final TextStyle? textStyle;
  late final FontWeight? fontWeight;

  MainDateTimePicker({
    required this.buttonText,
    this.icons,
    required this.onSelected,
    this.fontWeight,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () => onSelected(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        right: 14.58.w,
                      ),
                      child: Text(buttonText)),
                  Icon(
                    icons,
                    color: Colors.black,
                  )
                ],
              ),
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(4.17)),
            ),
          )),
        ],
      ),
    );
  }
}


