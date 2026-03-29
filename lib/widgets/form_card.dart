import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class FormCard extends StatefulWidget {
  const FormCard({super.key});

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final dbRefeerence=FirebaseFirestore.instance.collection('forms');
  List<Map<String,dynamic>> forms=[];

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: theme.outline,
          width: 1,
        )
      ),
      color:theme.surface,
      child: Column(
        children: [
          Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Icon(
                  Icons.school_rounded,
                  size: 60,
                ),
                // child: Image.asset(
                //   'assets/images/logo/surveylogolauncher.png',
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),
              )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'School Survey',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "valid till 1st March",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
