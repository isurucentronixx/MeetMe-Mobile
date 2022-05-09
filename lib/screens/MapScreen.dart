import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:meet_me_app/widgets/AbstractHomeWidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meet_me_app/widgets/AvatarCard.dart';

import '../widgets/Buttons.dart';

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
              child: Column(
                children: [
                  Flexible(
                    child: GoogleMap(
                      initialCameraPosition: _initialPosition,
                      mapType: MapType.normal,
                    ),
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Participants",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          
                          //color: Colors.red,
                          child: Scrollbar(
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Row(
                                  children: [
                                    AvatarCard(name: "Jeewantha"),
                                    AvatarCard(name: "Ashmini"),
                                    AvatarCard(name: "Uditha"),
                                    AvatarCard(name: "Gayan"),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          //color: Colors.greenAccent,
                          child: Text("On The way"),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                //color: Colors.red,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(right: 5),
                                      alignment: Alignment.center,
                                      child: MainElevatedButton(
                                        onPressed: () => {},
                                        child: Text("Cancel"),
                                      ),
                                      //color: Colors.purple,
                                      width: double.infinity,
                                    )),
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      alignment: Alignment.center,
                                      child: MainElevatedButton(
                                        onPressed: () => {},
                                        child: Text("You're on the way"),
                                      ),
                                      //color: Colors.pink,
                                      width: double.infinity,
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                //color: Colors.red,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(right: 5),
                                      alignment: Alignment.center,
                                      child: MainElevatedButton(
                                        onPressed: () => {
                                          Navigator.of(context).pushNamed('/editMeeting')
                                        },
                                        child: Text("Edit MeetMe"),
                                      ),
                                      //color: Colors.purple,
                                      width: double.infinity,
                                    )),
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      alignment: Alignment.center,
                                      child: MainElevatedButton(
                                        onPressed: () => {},
                                        child: Text("I've Arrived"),
                                      ),
                                      //color: Colors.pink,
                                      width: double.infinity,
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                //color: Colors.red,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                     
                                      alignment: Alignment.center,
                                      child: MainElevatedButton(
                                        onPressed: () => {},
                                        child: Text("End Meeting"),
                                      ),
                                      //color: Colors.purple,
                                      width: double.infinity,
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
