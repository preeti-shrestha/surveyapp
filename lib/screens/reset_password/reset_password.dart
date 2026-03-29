import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/cubit/login/auth_cubit.dart';
import 'package:surveyapp/cubit/login/auth_state.dart';
import '../../util/route_settings.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  TextEditingController email= TextEditingController();
  FirebaseAuth auth =FirebaseAuth.instance;

  void resetPassword()async{
    try{
      await auth.sendPasswordResetEmail(email: email.text);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please check your e-mail',
              style: Theme
                  .of(context)
                  .textTheme
                  .labelLarge,
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green.shade700,
          )
      );
      Navigator.pop(context);
    }catch(e){
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           content: Text(
             e.toString(),
             style: Theme
                 .of(context)
                 .textTheme
                 .labelLarge,
             textAlign: TextAlign.center,
           ),
           duration: Duration(seconds: 2),
           backgroundColor: Colors.red.shade700,
         )
     );
    }
  }

  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Expanded(
            // flex: 100,
            child: Form(
              key: formkey,
              child: Center(
                child: ListView(
                  padding: EdgeInsets.all(30),
                  shrinkWrap: true,
                  children: [
                    Image.asset(
                      "assets/images/logo/surveylogomain.png",
                      height: 150,
                    ),

                    SizedBox(height: 20,),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: Theme.of(context).textTheme.bodySmall,

                        hintText: "Enter your email",
                        hintStyle: Theme.of(context).textTheme.bodySmall,

                        prefixIcon: Icon(Icons.email_rounded),
                        suffixIcon: IconButton(
                          onPressed: (){
                            email.clear();
                          },
                          icon: Icon(Icons.close_rounded),
                        ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please enter your email";
                        }
                        if(!value.contains('@')){
                          return "Invalid e-mail";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                        onPressed: (){
                          if(formkey.currentState!.validate()){
                            resetPassword();
                          }
                        },
                        child: Text(
                          'Reset Password',
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}
