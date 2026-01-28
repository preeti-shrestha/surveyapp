import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:surveyapp/screens/home/home_screen.dart';
import 'package:surveyapp/screens/profile/editProfile_screen.dart';
import 'package:surveyapp/screens/profile/infoProfile_screen.dart';
import 'package:surveyapp/screens/profile/profile_screen.dart';
import 'package:surveyapp/screens/settings/settings_screen.dart';
import 'package:surveyapp/screens/userlogin/login_screen.dart';
import 'package:surveyapp/screens/userregister/register_screen.dart';
import 'package:surveyapp/screens/main_screen.dart';
class RouteHelper{
  static String login='/';
  static const String register='/register';
  static const String main='/main';
  static const String profile='/profile';
  static const String settings='/settings';
  static const String editProfile='/editProfile';
  static const String infoProfile='/infoProfile';
  static myRoutes(){
    return {
      login:(context)=>LoginForm(),
      register:(_)=>RegisterForm(),
      main:(_)=>MainScreen(),
      profile:(_)=>ProfileScreen(),
      settings:(_)=>SettingsScreen(),
      editProfile:(_)=>EditProfileScreen(),
      infoProfile:(_)=>InfoProfileScreen(),
    };
  }
}