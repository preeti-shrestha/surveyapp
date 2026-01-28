import 'package:flutter/material.dart';
import 'package:surveyapp/util/route_settings.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children:[
          Expanded(
              child: Container(
                // color: Colors.red,
              )
          ),
          Expanded(
            flex: 100,
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

                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
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
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      obscuringCharacter: '*',
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(

                        labelText: "Password",
                        labelStyle: Theme.of(context).textTheme.bodySmall,

                        hintText: "Enter your password",
                        hintStyle: Theme.of(context).textTheme.bodySmall,

                        prefixIcon: Icon(Icons.lock_rounded),

                        suffixIcon: IconButton(
                          onPressed: (){
                            email.clear();
                          },
                          icon: Icon(Icons.close_rounded),
                        ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please enter your password";
                        }
                      },
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                        onPressed: (){
                          // if(formkey.currentState!.validate()){
                            Navigator.pushReplacementNamed(context, RouteHelper.main);
                          // }
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                    ),

                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context).textTheme.labelSmall
                            ,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),

                    OutlinedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteHelper.register);
                      },
                      child: Text(
                        "Don't have an account? Register Here",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
                // color: Colors.red,
              )
          ),
        ]
      ),
    );
  }
}
