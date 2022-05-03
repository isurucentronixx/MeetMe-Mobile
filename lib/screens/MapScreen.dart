import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:meet_me_app/widgets/AbstractHomeWidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double availableHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    const CameraPosition _initialPosition =
        CameraPosition(target: LatLng(24.903623, 67.198367));
    return AbstractHomeView(
        selectedView: SelectedView.map,
        child: Column(
          children: [
            Container(
              width: width,
              height: availableHeight,
              child: GoogleMap(
                onTap: (argument) {
                  debugPrint('movieTitle: ');
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Text("Jeewa"),
                        );
                      });
                },
                initialCameraPosition: _initialPosition,
                mapType: MapType.normal,
              ),
            ),
          ],
        ));
  }
}
