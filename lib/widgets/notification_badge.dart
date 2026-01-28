import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NotificationBadge extends StatefulWidget {
  const NotificationBadge({super.key});

  @override
  State<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Badge(
        child: IconButton(
          onPressed: (){
            // return DropdownMenu(dropdownMenuEntries: [
            //
            // ])
          },
          icon: Icon(
            CupertinoIcons.bell_solid,
            size: 30,
            color: Color(0xFFeee6ff),
          ),
        ),
      ),
    );
  }
}
