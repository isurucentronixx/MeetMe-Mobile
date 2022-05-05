import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:meet_me_app/widgets/AbstractHomeWidget.dart';

class CalanderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AbstractHomeView(
        selectedView: SelectedView.clander,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: height * 0.5,
              //in hear we use carosal calander component. if you wanna additional details about
              //please visit to https://pub.dev/packages/flutter_calendar_carousel
              child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {},
                weekendTextStyle: TextStyle(
                  color: Colors.black,
                ),
                thisMonthDayBorderColor: Colors.grey,
                weekdayTextStyle: TextStyle(color: Colors.black),
                weekFormat: false,
                daysHaveCircularBorder: false,
              ),
            ),
            Container(
              height: height * 0.44,
              width: width,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("10 : 41 AM - 11:41 AM"),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text("Jeewantha Madubashana"),
                            ),
                            Container(
                              child: Text("Colombo"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("10 : 41 AM - 11:41 AM"),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text("Jeewantha Madubashana"),
                            ),
                            Container(
                              child: Text("Colombo"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("10 : 41 AM - 11:41 AM"),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text("Jeewantha Madubashana"),
                            ),
                            Container(
                              child: Text("Colombo"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("10 : 41 AM - 11:41 AM"),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text("Jeewantha Madubashana"),
                            ),
                            Container(
                              child: Text("Colombo"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("10 : 41 AM - 11:41 AM"),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text("Jeewantha Madubashana"),
                            ),
                            Container(
                              child: Text("Colombo"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("10 : 41 AM - 11:41 AM"),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text("Jeewantha Madubashana"),
                            ),
                            Container(
                              child: Text("Colombo"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("10 : 41 AM - 11:41 AM"),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text("Jeewantha Madubashana"),
                            ),
                            Container(
                              child: Text("Colombo"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
