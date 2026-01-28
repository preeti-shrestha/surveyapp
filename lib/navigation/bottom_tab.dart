import 'package:flutter/material.dart';
import 'package:surveyapp/screens/earnings/earnings_screen.dart';
import 'package:surveyapp/screens/home/home_screen.dart';
import 'package:surveyapp/screens/profile/profile_screen.dart';
import 'package:surveyapp/screens/profile/viewProfile.dart';
class AppBottomTab extends StatefulWidget {
  const AppBottomTab({super.key});

  @override
  State<AppBottomTab> createState() => _AppBottomTabState();
}

class _AppBottomTabState extends State<AppBottomTab> {
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
    return BottomNavigationBar(
      key: globalKey,
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
    );
  }
}
