import 'package:flutter/material.dart';
class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context).colorScheme;
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
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
                  'Available Balance',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NRS 50',
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
                      'Total Earnings',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'Collected',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      'NRS 200',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'NRS 150',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
        SizedBox(height: 15,),
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
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LINK E-SEWA',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    GestureDetector(
                        onTap: (){},
                        child: Image.asset(
                          'assets/images/icon/esewa.png',
                          // height: 30,
                          // color: Theme.of(context).colorScheme.primary,
                        )
                    ),
                  ],
                ),
                Text(
                  'Please verify your e-sewa account to start receiving payments',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15,),
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
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available Forms',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'Please fill more forms to increase your wallet balance',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15,),
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
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Collection History',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'Please find your past collected earnings here.',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),


      ],
    );
  }
}
