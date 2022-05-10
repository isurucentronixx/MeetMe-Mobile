import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactCard extends StatelessWidget {
  late final String name;
  late final String contactNumber;
  late final String? imageUrl;

  ContactCard({required this.name, required this.contactNumber, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(backgroundColor: Colors.green,child: Text(name.substring(0,1).toUpperCase(), style: Theme.of(context).textTheme.button)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(name),
                Text(contactNumber),
              ],
            )
          ],
        ),
      ),
    );
  }
}
