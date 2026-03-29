import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/navigation/bottom_tab.dart';
import 'package:surveyapp/navigation/drawer.dart';
import 'package:surveyapp/screens/earnings/earnings_screen.dart';
import 'package:surveyapp/screens/home/home_screen.dart';
import 'package:surveyapp/screens/logout/logout_screen.dart';
import 'package:surveyapp/screens/profile/profile_screen.dart';
import 'package:surveyapp/screens/profile/viewProfile.dart';
import 'package:surveyapp/screens/settings/settings_screen.dart';
import 'package:surveyapp/widgets/notification_badge.dart';

import '../util/route_settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> bottomNav=[
    HomeScreen(),
    EarningsScreen(),
    ViewProfile(),
  ];
  List<String> titles=['Home','Earnings','Profile'];
  int currentIndex=0;
  GlobalKey<ScaffoldState> globalKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isLight=Theme.of(context).brightness==Brightness.light;
    final logo= Image.asset(
      'assets/images/logo/surveylogoappbar.png',
      height: 40,
    );
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: isLight? ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Color(0xFFeee6ff),
                    BlendMode.srcIn,
                  ),
                  child: logo, // Your original image
                ):logo,
        actions: [
          NotificationBadge(),
        ],
      ),
      body: bottomNav[currentIndex],
      //NAVIGATION DRAWER
      drawer: AppDrawer(currentRoute: RouteHelper.main,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex=value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
      ),
      // bottomNavigationBar: AppBottomTab(),
    );
  }
}
