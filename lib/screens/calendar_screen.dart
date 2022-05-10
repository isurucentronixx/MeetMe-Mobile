import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:meet_me_app/widgets/abstract_home_widget.dart';
import 'package:calendar_view/calendar_view.dart';

class CalanderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AbstractHomeView(
        selectedView: SelectedView.clander,
        child: DayView(
            controller: EventController(),
            eventTileBuilder: (date, events, boundry, start, end) {
              // Return your widget to display as event tile.
              return Container(
               
              );
            },
            showVerticalLine: true, // To display live time line in day view.
            showLiveTimeLineInAllDays:
                true, // To display live time line in all pages in day view.

            heightPerMinute: 1, // height occupied by 1 minute time span.
            eventArranger:
                SideEventArranger(), // To define how simultaneous events will be arranged.
            onEventTap: (events, date) => print(events),
            onDateLongPress: (date) => print(date)));
  }
}
