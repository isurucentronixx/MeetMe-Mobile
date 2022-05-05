import 'package:flutter/material.dart';
import 'package:meet_me_app/gen/assets.gen.dart';

enum SelectedView { none, clander, map, addmeeting, notification, profile }

class AbstractHomeView extends StatelessWidget {
  final SelectedView selectedView;
  final Widget child;

  const AbstractHomeView({
    Key? key,
    required this.selectedView,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
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
                  onPressed: () => {Navigator.of(context).pushNamed('/map')},
                  icon: Assets.images.markerMap.image()),
              IconButton(
                  onPressed: () => {Navigator.of(context).pushNamed('/addMeeting')}, icon: Assets.images.roundPlus.image()),
              IconButton(onPressed: () => {}, icon: Assets.images.bell.image()),
              IconButton(
                  onPressed: () => {Navigator.of(context).pushNamed('/profile')}, icon: Assets.images.profile.image()),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
