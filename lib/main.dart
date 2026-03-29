import 'package:firebase_core/firebase_core.dart';
import 'package:surveyapp/cubit/login/auth_cubit.dart';
import 'package:surveyapp/cubit/register/register_cubit.dart';
import 'package:surveyapp/util/route_settings.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/cubit/theme/theme_cubit.dart';
import 'package:surveyapp/util/app_theme.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ThemeCubit(),),
        BlocProvider(create: (_)=>RegisterCubit(),),
        BlocProvider(create: (_)=>AuthCubit(),),
      ],
      child: BlocBuilder<ThemeCubit,ThemeMode>(
        builder: (context,themeMode){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: AppTheme.lightTheme,
            darkTheme:AppTheme.darkTheme,
            routes:RouteHelper.myRoutes(),
          );
        }
      ),
    );
  }
}