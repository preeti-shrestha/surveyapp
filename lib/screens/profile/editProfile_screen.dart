import 'package:flutter/material.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
  Map<String,dynamic> userInfo={
    'Name':'Preeti Shrestha',
    'E-mail':'preetistha24@gmail.com',
    'Address':'Dhading',
    'Gender':'Female',
  };
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Expanded(
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              SizedBox(height: 10,),
              CircleAvatar(
                radius: 100,
                child: ClipOval(
                  child: InkWell(
                    onTap: (){
                      showModalBottomSheet<dynamic>(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: false,
                          builder: (BuildContext bc){
                            return Wrap(
                              children: [
                                ListTile(
                                  title: Text(
                                      'Choose From Gallery',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  leading: Icon(Icons.photo),
                                ),
                                ListTile(
                                  title: Text(
                                    'Open Camera',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  leading: Icon(Icons.photo_camera_rounded),
                                )
                              ],
                            );
                          }
                      );
                    },
                    child: Image(
                      image: AssetImage('assets/images/profile/profile1.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Form(
                key: formkey,
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [

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

                          labelText: "Confirm Password",
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // fixedSize: Size.infinite,
                              backgroundColor: Colors.red,
                            ),
                              onPressed: (){
                                Navigator.pop(context);
                              },

                              child: Text(
                                'Cancel',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),

                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // fixedSize: Size.infinite,
                                // backgroundColor: Colors.red,
                              ),
                              onPressed: (){
                                final isFormValid=formkey.currentState!.validate();
                                if(isFormValid){
                                  // print("FOrm is valid. Gender: $gender");
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                'Update',
                                style: Theme.of(context).textTheme.labelLarge,
                              )
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          )
      ),

    );
  }
}
