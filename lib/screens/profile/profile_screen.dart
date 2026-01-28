import 'package:flutter/material.dart';
import 'package:surveyapp/screens/profile/viewProfile.dart';
import 'package:surveyapp/util/route_settings.dart';
import 'package:surveyapp/widgets/notification_badge.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        // actions: [
        //   NotificationBadge(),
        // ],
      ),
      body: ViewProfile(),
    );
  }
}
