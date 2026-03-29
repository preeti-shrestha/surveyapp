import 'package:flutter/material.dart';

import '../../widgets/form_bottomsheet.dart';
class FilledformsScreen extends StatefulWidget {
  const FilledformsScreen({super.key});

  @override
  State<FilledformsScreen> createState() => _FilledformsScreenState();
}

class _FilledformsScreenState extends State<FilledformsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Surveys'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          for(int i=0;i<10;i++)
            InkWell(
              onTap:(){
                showModalBottomSheet(
                    context: context,
                    builder: (context){
                      return FormBottomsheet();
                    }
                );
              },
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.school_rounded,
                      size: 50,
                    ),
                    title: Text(
                      'School Survey',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'This survey is conducted to know the Quality of your school',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
        ],
      ),
    );
  }
}
