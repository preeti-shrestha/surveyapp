import 'package:flutter/material.dart';
import 'package:surveyapp/widgets/logout_dialog.dart';

import '../util/route_settings.dart';
class AppDrawer extends StatefulWidget {
  final String currentRoute;
  const AppDrawer({super.key,required this.currentRoute});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 50,),
          // ColorFiltered(
          //   colorFilter: ColorFilter.mode(
          //     Color(0xFFeee6ff),
          //     BlendMode.srcIn,
          //   ),
          //   child: Image.asset('assets/images/logo/surveylogomain.png',height: 150,)
          // ),
          Image.asset('assets/images/logo/surveylogomain.png',height: 150,),
          SizedBox(height: 30,),
          ListTile(
            selected: widget.currentRoute==RouteHelper.main,
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, RouteHelper.main);
            },
            leading: Icon(Icons.home_rounded),
            title: Text("Home",style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 5,),
          ListTile(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteHelper.profile);
            },
            leading: Icon(Icons.account_circle_rounded),
            title: Text("Profile",style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 5,),

          ListTile(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, RouteHelper.settings);
            },
            leading: Icon(Icons.settings_rounded),
            title: Text("Settings",style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 5,),

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
            title: Text("Logout",style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
