import 'dart:html';

import 'package:flutter/material.dart';
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
                    color: Colors.purple,
                    height: availableHeight * 0.2,
                    child: SingleChildScrollView(
                      child: Column(
                        
                        children: [

                          Container(
                            color: Colors.red,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: CircleAvatar(backgroundColor: Colors.green),
                                ),

                                Container(
                                  child: Column(
                                    children: [
                                      Text("Jeewantha"),
                                      Text("+ 94 714874141"),
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          ),



                          Row(children: [
                            CircleAvatar(backgroundColor: Colors.green),
                            Text("Jeewantha"),

                          ]),
                                      
                          Row(children: [
                            CircleAvatar(backgroundColor: Colors.green),
                            Text("Jeewantha")
                          ]),
                                      
                          Row(children: [
                            CircleAvatar(backgroundColor: Colors.green),
                            Text("Jeewantha")
                          ]),
                    
                          Row(children: [
                            CircleAvatar(backgroundColor: Colors.green),
                            Text("Jeewantha")
                          ]),
                    
                          Row(children: [
                            CircleAvatar(backgroundColor: Colors.green),
                            Text("Jeewantha")
                          ])
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
