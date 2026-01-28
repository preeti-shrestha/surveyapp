import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/cubit/theme/theme_cubit.dart';
import 'package:surveyapp/firebase_options.dart';
import 'package:surveyapp/screens/home/home_screen.dart';
import 'package:surveyapp/screens/userlogin/login_screen.dart';
import 'package:surveyapp/util/app_theme.dart';
import 'package:surveyapp/util/route_settings.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return BlocProvider(
        create: (_)=>ThemeCubit(),
      child: BlocBuilder<ThemeCubit,ThemeMode>(
          builder: (context,themeMode){
            return MaterialApp(

              debugShowCheckedModeBanner: false,

              themeMode: themeMode,
              theme: AppTheme.lightTheme,
              // darkTheme:ThemeData.dark(),
              darkTheme:AppTheme.darkTheme,

              routes:RouteHelper.myRoutes(),
              // onGenerateRoute: (setting)=>RouteHelper.myGenerateRoutes(setting),

            );
          }
      ),
    );
  }
}