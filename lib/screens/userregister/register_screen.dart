import 'package:flutter/material.dart';
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

  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
          children:[
            // Expanded(
            //     child: Container(
            //       // color: Colors.red,
            //     )
            // ),
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
                              email.clear();
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
                              email.clear();
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

                      FormField(
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

                      SizedBox(height: 20),

                      ElevatedButton(
                          onPressed: (){
                            final isFormValid=formkey.currentState!.validate();
                            if(isFormValid){
                              // print("FOrm is valid. Gender: $gender");
                              Navigator.pop(context);
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
            // Expanded(
            //     child: Container(
            //       // color: Colors.red,
            //     )
            // ),
          ]
      ),
    );
  }
}
