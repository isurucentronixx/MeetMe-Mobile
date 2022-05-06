import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarCard extends StatelessWidget {
  late final String name;
  late final String? imageUrl;

  AvatarCard({required this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
       //color: Colors.yellow,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(backgroundColor: Colors.green,child: Text(name.substring(0,1).toUpperCase(), style: Theme.of(context).textTheme.button,),),
          SizedBox(height: 5,),
          Text(name)
        ],
      ),
    );
  }
}
