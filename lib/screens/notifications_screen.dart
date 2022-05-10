import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_me_app/widgets/abstract_home_widget.dart';

import '../models/notifications_screen_selections.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<Map<String, String>> _items;

  @override
  void initState() {
    _items = NotificationsScreenSelections.Values;
    _tabController =
        TabController(length: _items.length, initialIndex: 0, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AbstractHomeView(
        selectedView: SelectedView.notification,
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      new Container(
                        width: width * 0.41,
                        child: new Tab(text: 'Recent'),
                      ),
                      new Container(
                        width: width * 0.41,
                        child: new Tab(text: 'Older'),
                      )
                    ],
                  ),
                ),

                Expanded(child: Container(
                  //color: Colors.red,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView(
                          children: [
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                          ],
                        ),
                        ListView(
                          children: [
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                            Card(child: ListTile(title: Text('A single notification'))),
                          ],
                        )
                      ],
                  
                  
                    ),
                  ),
                ))


                // TabBarView(
                //   controller: _tabController,
                //   dragStartBehavior: DragStartBehavior.start,
                //   children: [
                //     Expanded(
                      
                //       child: Container(
                //         width: width,
                //         child: Text("Jeewa"),
                //         color: Colors.red,

                //     )),

                //     Expanded(
                      
                //       child: Container(
                //         width: width,
                //         child: Text("Jeewa"),
                //         color: Colors.red,

                //     ))
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}
