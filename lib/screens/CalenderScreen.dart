import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';

class CalanderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500.w,
        height: 100.h,
        color: Colors.red,
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () =>
                      {Navigator.of(context).pushNamed('/calander')},
                  icon: Assets.images.calendar.image()),
              IconButton(
                  onPressed: () => {}, icon: Assets.images.markerMap.image()),
              IconButton(
                  onPressed: () => {}, icon: Assets.images.roundPlus.image()),
              IconButton(onPressed: () => {}, icon: Assets.images.bell.image()),
              IconButton(
                  onPressed: () =>
                      {Navigator.of(context).pushNamed('/profile')},
                  icon: Assets.images.profile.image()),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
