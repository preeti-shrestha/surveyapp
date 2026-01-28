import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/cubit/theme/theme_cubit.dart';
import 'package:surveyapp/widgets/notification_badge.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // String? groupValue='system';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body:BlocBuilder<ThemeCubit,ThemeMode>(
        builder: (context,themeMode) {
          return ListView(
            padding: EdgeInsets.all(20),
            children: [
              Text(
                'Theme',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
              RadioMenuButton(
                  value: ThemeMode.system,
                  groupValue: themeMode,
                  onChanged: (value) {
                    setState(() {
                      context.read<ThemeCubit>().changeTheme(value!);
                    });
                  },
                  child: Text("System", style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,)
              ),
              RadioMenuButton(
                  value: ThemeMode.light,
                  groupValue: themeMode,
                  onChanged: (value) {
                    setState(() {
                      context.read<ThemeCubit>().changeTheme(value!);
                    });
                  },
                  child: Text("Light", style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,)
              ),
              RadioMenuButton(
                  value: ThemeMode.dark,
                  groupValue: themeMode,
                  onChanged: (value) {
                    setState(() {
                      context.read<ThemeCubit>().changeTheme(value!);
                    });
                  },
                  child: Text("Dark", style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,)
              ),
            ],
          );
        }
      ),
    );
  }
}
