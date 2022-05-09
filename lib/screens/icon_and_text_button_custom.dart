import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class IconAndTextButton extends StatelessWidget {
  const IconAndTextButton({
    required this.buttonText,
    this.icons,
    required this.onSelected,
    this.fontWeight,
    this.textStyle,
  });
  final String buttonText;
  final IconData? icons;
  final VoidCallback onSelected;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () => onSelected(),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
