import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/cubit/register/register_cubit.dart';
import 'package:surveyapp/cubit/register/register_state.dart';
import '../../util/route_settings.dart';
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController full_name= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController address= TextEditingController();
  TextEditingController set_password= TextEditingController();
  TextEditingController confirm_password= TextEditingController();
  String? gender;
  Map<String,String> gendermap={
    'male':'Male',
    'female':'Female',
    'others':'Others'
  };

  // final dbReference = FirebaseFirestore.instance.collection('users');

  final formkey=GlobalKey<FormState>();

  // FirebaseAuth auth=FirebaseAuth.instance;

  // bool loading=false;

  // void registerNow() async{
  //   setState(() {
  //     loading=true;
  //   });
  //   try {
  //     await auth.createUserWithEmailAndPassword(
  //       email: email.text,
  //       password: confirm_password.text,
  //     );
  //   }catch(e){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  //   }finally{
  //     setState(() {
  //       loading=false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocConsumer<RegisterCubit,RegisterState>(
        builder: (context,state){
          if(state is RegisterLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
                children:[
                  Expanded(
                    // flex: 100,
                    child: Form(
                      key: formkey,
                      child: Center(
                        child: ListView(
                          padding: EdgeInsets.all(20),
                          shrinkWrap: true,
                          children: [
                            Image.asset(
                              "assets/images/logo/surveylogomain.png",
                              height: 150,
                            ),

                            SizedBox(height: 20),

                            Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),

                            SizedBox(height: 20),

                            TextFormField(
                              controller: full_name,
                              keyboardType: TextInputType.name,
                              style: Theme.of(context).textTheme.bodySmall,
                              decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: Theme.of(context).textTheme.bodySmall,

                                hintText: "Enter your full name",
                                hintStyle: Theme.of(context).textTheme.bodySmall,

                                prefixIcon: Icon(Icons.account_circle_rounded),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    full_name.clear();
                                  },
                                  icon: Icon(Icons.close_rounded),
                                ),
                              ),
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Please enter your name";
                                }
                                // if(!value.contains('@')){
                                //   return "Invalid name";
                                // }
                                return null;
                              },
                            ),

                            SizedBox(height: 20),

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

                            SizedBox(height: 20),

                            TextFormField(
                              controller: address,
                              keyboardType: TextInputType.text,
                              style: Theme.of(context).textTheme.bodySmall,
                              decoration: InputDecoration(
                                labelText: "Address",
                                labelStyle: Theme.of(context).textTheme.bodySmall,

                                hintText: "Enter your address",
                                hintStyle: Theme.of(context).textTheme.bodySmall,

                                prefixIcon: Icon(Icons.location_on_rounded),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    address.clear();
                                  },
                                  icon: Icon(Icons.close_rounded),
                                ),
                              ),
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Please enter your address";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 20),


                            Flexible(
                              child: FormField(
                                  validator: (value){
                                    if(gender==null||gender!.isEmpty){
                                      return 'Please select your gender';
                                    }
                                    return null;
                                  },
                                  builder: (state){
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Gender',
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                        Row(
                                          children: [
                                            for(var entry in gendermap.entries)
                                              RadioMenuButton(
                                                  value: entry.key,
                                                  groupValue: gender,
                                                  onChanged: (value){
                                                    setState(() {
                                                      gender=value;
                                                    });
                                                    state.didChange(value);
                                                  },
                                                  child: Text(
                                                    entry.value,
                                                    style: Theme.of(context).textTheme.bodySmall,
                                                  )
                                              ),
                                          ],
                                        ),
                                        if(state.hasError)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Text(
                                              state.errorText!,
                                              style: Theme.of(context).textTheme.displaySmall,
                                            ),
                                          ),
                                      ],
                                    );
                                  }
                              ),
                            ),
                            SizedBox(height: 20),

                            TextFormField(
                              controller: set_password,
                              obscureText: true,
                              obscuringCharacter: '*',
                              style: Theme.of(context).textTheme.bodySmall,
                              decoration: InputDecoration(

                                labelText: "Set Password",
                                labelStyle: Theme.of(context).textTheme.bodySmall,

                                hintText: "Set your password",
                                hintStyle: Theme.of(context).textTheme.bodySmall,

                                prefixIcon: Icon(Icons.lock_rounded),

                                suffixIcon: IconButton(
                                  onPressed: (){
                                    set_password.clear();
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

                            SizedBox(height: 20),

                            TextFormField(
                              controller: confirm_password,
                              obscureText: true,
                              obscuringCharacter: '*',
                              style: Theme.of(context).textTheme.bodySmall,
                              decoration: InputDecoration(

                                labelText: "Password",
                                labelStyle: Theme.of(context).textTheme.bodySmall,

                                hintText: "Confirm your password",
                                hintStyle: Theme.of(context).textTheme.bodySmall,

                                prefixIcon: Icon(Icons.lock_rounded),

                                suffixIcon: IconButton(
                                  onPressed: (){
                                    confirm_password.clear();
                                  },
                                  icon: Icon(Icons.close_rounded),
                                ),
                              ),
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Please enter your password";
                                }
                                if(value != set_password.text){
                                  return "Password must be same";
                                }
                              },
                            ),

                            SizedBox(height: 20),

                            ElevatedButton(
                                onPressed: (){
                                  final isFormValid=formkey.currentState!.validate();
                                  if(isFormValid){
                                    context.read<RegisterCubit>().register(
                                        name: full_name.text,
                                        email: email.text,
                                        address: address.text,
                                        gender: gender.toString(),
                                        password: confirm_password.text
                                    );
                                  }
                                },
                                child: Text(
                                  'Register',
                                  style: Theme.of(context).textTheme.labelLarge,
                                )
                            ),

                            SizedBox(height: 20,),

                            OutlinedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Already have an account? Login Here",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          );
        },
        listener: (context,state) {
          if(state is RegisterSuccessState){
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    titleTextStyle: Theme.of(context).textTheme.titleSmall,
                    contentTextStyle: Theme.of(context).textTheme.bodySmall,
                    title: Text('Success'),
                    content: Text(
                      'You have been registered',
                      // style: Theme.of(context).textTheme.titleSmall,
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouteHelper.login);
                        },
                        icon: Icon(Icons.check_rounded),
                      ),
                    ],
                  );
                }
            );
          }
          if(state is RegisterFailureState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      state.msg,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                backgroundColor: Colors.red.shade700,
              )
            );
          }
        },
      ),
    );
  }
}
