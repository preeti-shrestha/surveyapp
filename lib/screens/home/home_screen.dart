import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/widgets/form_bottomsheet.dart';
import 'package:surveyapp/widgets/form_card.dart';

import '../../util/route_settings.dart';
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // final dbReference=FirebaseFirestore.instance.collection('forms');
  // List<Map<String,dynamic>> forms=[];
  // void fetchForms() async{
  //   dbReference.snapshots().listen((data){
  //     forms.clear();
  //     setState(() {
  //       for(var doc in data.docs){
  //         forms.add(doc.data());
  //       }
  //     });
  //   });
  // }
  //
  // @override
  // void initState() {
  //   fetchForms();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context).colorScheme;

    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Text(
            'Hello User!',
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 10,),

        Flexible(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:theme.outline,
                width: 1,
                style: BorderStyle.solid,
              ),
              boxShadow:[
                BoxShadow(
                  color: Color(0xffcc99ff),
                  blurRadius: 2,
                  offset: Offset(0, 1)
                ),
              ],
            ),
            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Earnings',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NRS 100',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Image.asset(
                          'assets/images/icon/money-withdrawal.png',
                          height: 70,
                          color: Theme.of(context).colorScheme.primary,
                        )
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisSpacing: 20,
                    crossAxisCount: 2,
                  childAspectRatio: 4/1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      'Collected',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Collectible',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'NRS 50',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'NRS 50',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),

        SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Available Forms',
              style: Theme.of(context).textTheme.titleSmall,
              // textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, RouteHelper.availableSurveys);
              },
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.labelMedium,
                // textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        SizedBox(height: 10,),

        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for(int i=0;i<10;i++)
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      // backgroundColor: theme.surface,
                        context: context,
                        showDragHandle: true,
                        builder: (context){
                          return FormBottomsheet();
                        }
                    );
                  },
                  child: FormCard(),
                )
            ],
          ),
        ),

        SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Filled Forms',
              style: Theme.of(context).textTheme.titleSmall,
              // textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, RouteHelper.completedSurveys);
              },
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.labelMedium,
                // textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        SizedBox(height: 10,),

        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for(int i=0;i<10;i++)
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        // backgroundColor: theme.surface,
                        context: context,
                        showDragHandle: true,
                        builder: (context){
                          return FormBottomsheet();
                        }
                    );
                  },
                  child: FormCard(),
                )
            ],
          ),
        ),

      ],
    );
  }
}


