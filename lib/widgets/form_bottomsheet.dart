import 'package:flutter/material.dart';
import '../util/route_settings.dart';
class FormBottomsheet extends StatefulWidget {
  const FormBottomsheet({super.key});

  @override
  State<FormBottomsheet> createState() => _FormBottomsheetState();
}

class _FormBottomsheetState extends State<FormBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        // Flexible(
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(20),
        //       child: Icon(
              Icon(
                Icons.school_rounded,
                size: 150,
              ),
              // child: Image.asset(
              //   'assets/images/products/${widget.product_image}',
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
            // )
        // ),
        SizedBox(height: 10),
        Text(
          'School Quality',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        Text(
          'This survey is conducted to know the Quality of your school',
          style: Theme.of(context).textTheme.bodySmall,
        ),

        SizedBox(height: 10),

        Text(
          "valid till 21st Feb",
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.right,
        ),

        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteHelper.webView);
            // showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(
            //         titleTextStyle: Theme
            //             .of(context)
            //             .textTheme
            //             .titleSmall,
            //         contentTextStyle: Theme
            //             .of(context)
            //             .textTheme
            //             .bodySmall,
            //         title: Text('Survey Completed'),
            //         content: Text(
            //             'Thank you for filling out the form'
            //         ),
            //         actions: [
            //           TextButton(
            //             onPressed: () {
            //               Navigator.pop(context);
            //             },
            //             child: Text('OK'),
            //           ),
            //         ],
            //       );
            //     }
            // );
          },
          child: Text('Start Survey'),
        )
      ],
    );
  }
}
