import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meet_me_app/screens/icon_and_text_button_custom.dart';
import 'package:meet_me_app/widgets/ContactCard.dart';
import 'package:meet_me_app/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_me_app/widgets/Buttons.dart';

class EditMeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double availableHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: const Text(
            'Edit MeetMe',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //meeting name
                  Container(
                    //color: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MeetMe Name",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Add title to Your MeetMe',
                          ),
                        )
                      ],
                    ),
                  ),

                  //start date and time

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Date and Time",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(right: 5),
                              child: MainDateTimePicker(
                                buttonText: 'MM/DD/YYYY',
                                fontWeight: FontWeight.w600,
                                icons: Icons.date_range_outlined,
                                onSelected: () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 1),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                    //borderRadius: 2,
                                  );
                                },
                              ),
                            )),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: MainDateTimePicker(
                                buttonText: '00.00 PM',
                                fontWeight: FontWeight.w600,
                                icons: Icons.date_range_outlined,
                                onSelected: () async {
                                  await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),

                                    //borderRadius: 2,
                                  );
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),

                  //end date and time
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "End Date and Time",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(right: 5),
                              child: MainDateTimePicker(
                                buttonText: 'MM/DD/YYYY',
                                fontWeight: FontWeight.w600,
                                icons: Icons.date_range_outlined,
                                onSelected: () async {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 1),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                    //borderRadius: 2,
                                  );
                                },
                              ),
                            )),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: MainDateTimePicker(
                                buttonText: '00.00 PM',
                                fontWeight: FontWeight.w600,
                                icons: Icons.date_range_outlined,
                                onSelected: () async {
                                  await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),

                                    //borderRadius: 2,
                                  );
                                },
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),

                  //participants
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Participants",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),

                        SizedBox(
                          height: 8,
                        ),
                        //participants list
                        Container(
                          //color: Colors.purple,
                          height: availableHeight * 0.2,
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ContactCard(
                                      name: "Jeewantha Madubashana",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Uduitha Eranga",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Ashmini Wijesekara",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Sachini Rajasingha",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Basil Rajapaksha",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Namal Rajapaksha",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Chamal Rajapaksha",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Naml Rajapaksha",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Gotabhaya Rajapaksha",
                                      contactNumber: "+94 123456789"),
                                  ContactCard(
                                      name: "Hashan Rajapaksha",
                                      contactNumber: "+94 123456789"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //add participatns

                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline_rounded),
                      iconSize: 45.h,
                    ),
                  ),

                  //button
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: MainElevatedButton(
                      onPressed: () => {},
                      child: Text("Update"),
                    ),
                    //color: Colors.purple,
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
