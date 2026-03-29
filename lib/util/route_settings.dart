import 'package:surveyapp/screens/forms/availableforms_screen.dart';
import 'package:surveyapp/screens/forms/filledforms_screen.dart';
import 'package:surveyapp/screens/profile/editProfile_screen.dart';
import 'package:surveyapp/screens/profile/infoProfile_screen.dart';
import 'package:surveyapp/screens/profile/profile_screen.dart';
import 'package:surveyapp/screens/reset_password/reset_password.dart';
import 'package:surveyapp/screens/settings/settings_screen.dart';
import 'package:surveyapp/screens/userlogin/login_screen.dart';
import 'package:surveyapp/screens/userregister/register_screen.dart';
import 'package:surveyapp/screens/main_screen.dart';
import 'package:surveyapp/screens/webview_screen.dart';
import 'package:surveyapp/util/auth_wrapper.dart';
class RouteHelper{
  static String splash='/';
  static String login='/login';
  static const String register='/register';
  static const String main='/main';
  static const String profile='/profile';
  static const String settings='/settings';
  static const String editProfile='/editProfile';
  static const String infoProfile='/infoProfile';
  static const String availableSurveys='/availableSurveys';
  static const String completedSurveys='/completedSurveys';
  static const String webView='/webView';
  static const String resetPassword='/resetPassword';
  static myRoutes(){
    return {
      splash:(_)=>AuthWrapper(),
      login:(context)=>LoginForm(),
      register:(_)=>RegisterForm(),
      main:(_)=>MainScreen(),
      profile:(_)=>ProfileScreen(),
      settings:(_)=>SettingsScreen(),
      editProfile:(_)=>EditProfileScreen(),
      infoProfile:(_)=>InfoProfileScreen(),
      availableSurveys:(_)=>AvailableformsScreen(),
      completedSurveys:(_)=>FilledformsScreen(),
      webView:(_)=>WebviewScreen(),
      resetPassword:(_)=>ResetPassword(),
    };
  }
}
