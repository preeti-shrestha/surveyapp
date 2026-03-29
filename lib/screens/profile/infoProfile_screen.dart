import 'package:flutter/material.dart';
import '../../../../surveyadmin/lib/util/route_settings.dart';
import '../../util/route_settings.dart';
class InfoProfileScreen extends StatefulWidget {
  const InfoProfileScreen({super.key});

  @override
  State<InfoProfileScreen> createState() => _InfoProfileScreenState();
}

class _InfoProfileScreenState extends State<InfoProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> userInfo={
      'Name':'Preeti Shrestha',
      'E-mail':'preetistha24@gmail.com',
      'Address':'Dhading',
      'Gender':'Female',
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Info'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, RouteHelper.editProfile);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Expanded(
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              SizedBox(height: 10,),
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
              for (var entry in userInfo.entries)
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        entry.key,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      trailing: Text(
                        entry.value,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
            ],
          )
      ),
    );
  }
}
