import 'package:flutter/material.dart';
class InfoProfileScreen extends StatefulWidget {
  const InfoProfileScreen({super.key});

  @override
  State<InfoProfileScreen> createState() => _InfoProfileScreenState();
}

class _InfoProfileScreenState extends State<InfoProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Info'),
      ),
        body: Center(
          child: Text('Profile Info'),
        )
    );
  }
}
