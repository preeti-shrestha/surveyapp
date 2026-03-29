import 'package:flutter/material.dart';
import 'package:surveyapp/widgets/logout_dialog.dart';

import '../../util/route_settings.dart';
class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        SizedBox(height: 30,),
        CircleAvatar(
          radius: 100,
          child: ClipOval(
            child: Image(
              image: AssetImage('assets/images/profile/profile1.jpg'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 10,),
        Center(
          child: Text(
            "Preeti Shrestha",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(height: 30,),

        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  // color: Colors.white60,
                  child: Text('20+ Forms Filled',textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium,),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 1,
              color: Colors.purple.shade200,
            ),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  // color: Colors.white60,
                  child: Text('Rs 100+ Earned',textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium,),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30,),

        ListTile(
          leading: Icon(Icons.account_circle_rounded),
          title: Text(
            "Profile Info",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          onTap: (){
            Navigator.pushNamed(context, RouteHelper.infoProfile);
          },
        ),
        SizedBox(height: 10,),

        ListTile(
          leading: Icon(Icons.edit_rounded),
          title: Text(
            "Edit Profile",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          onTap: (){
            Navigator.pushNamed(context, RouteHelper.editProfile);
          },
        ),

        SizedBox(height: 10,),

        ListTile(
          leading: Icon(Icons.settings_rounded),
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          onTap: (){
            Navigator.pushNamed(context, RouteHelper.settings);
          },
        ),
        SizedBox(height: 10,),
        ListTile(
          onTap: (){
            showDialog(
                context: context,
                builder: (context) {
                  return LogoutDialog();
                }
            );
          },
          leading: Icon(Icons.logout_rounded),
          title: Text(
            "Log Out",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
