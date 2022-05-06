import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meet_me_app/widgets/ContactCard.dart';
import 'package:meet_me_app/widgets/app_bar.dart';

class EditMeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double availableHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Edit MeetMe',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
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
                        child: Text("Star date picker goes hear"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text("Star time picker goes hear"),
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
                        child: Text("End date picker goes hear"),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text("End time  picker goes hear"),
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

                  //add participatns
                  Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Add Participants'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline_rounded),
                          
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
