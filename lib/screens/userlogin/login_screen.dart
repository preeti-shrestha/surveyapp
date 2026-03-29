import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/cubit/login/auth_cubit.dart';
import 'package:surveyapp/cubit/login/auth_state.dart';
import '../../util/route_settings.dart';
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

      body: BlocConsumer<AuthCubit,AuthState>(
        builder: (context,state){
          if(state is AuthLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
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
                                if(formkey.currentState!.validate()){
                                  context.read<AuthCubit>().login(
                                    email.text,
                                    password.text
                                  );
                                }
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
                                onPressed: (){
                                  Navigator.pushNamed(context, RouteHelper.resetPassword);
                                },
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
          );
        },
        listener: (context,state) async{
          if (state is AuthSuccessState){
            final snackBar=ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Login Success",
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
            await snackBar.closed;
            if(context.mounted) {
              Navigator.pushNamedAndRemoveUntil(context, RouteHelper.main, (value)=>false);
            }
          }
          if (state is AuthFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.msg,
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
      )
    );
  }
}
