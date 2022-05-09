import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meet_me_app/screens/icon_and_text_button_custom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/widgets/Buttons.dart';

class AddTime extends StatelessWidget {
  const AddTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 75),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: EdgeInsets.only(
            left: 8.0.w, right: 8.0.w, top: 12.0.h, bottom: 8.0.h),
        child: Column(
          children: [
            Row(
              children: [
                IconAndTextButton(
                  buttonText: 'MM/DD/YYYY',
                  fontWeight: FontWeight.w600,
                  icons: Icons.date_range_outlined,
                  onSelected: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      //borderRadius: 2,
                    );
                  },
                ),
                SizedBox(
                  width: 12.0.w,
                ),
                IconAndTextButton(
                  buttonText: '00.00 PM',
                  fontWeight: FontWeight.w600,
                  onSelected: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),

                      //borderRadius: 2,
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                IconAndTextButton(
                  buttonText: 'MM/DD/YYYY',
                  fontWeight: FontWeight.w600,
                  icons: Icons.date_range_outlined,
                  onSelected: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      //borderRadius: 2,
                    );
                  },
                ),
                SizedBox(
                  width: 12.0.w,
                ),
                IconAndTextButton(
                  buttonText: '00.00 PM',
                  fontWeight: FontWeight.w600,
                  onSelected: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),

                      //borderRadius: 2,
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 25.0.h,
            ),
            MainElevatedButton(onPressed: () {}, child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
